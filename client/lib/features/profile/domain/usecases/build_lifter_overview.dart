import 'package:client/features/profile/domain/entities/lift_record.dart';
import 'package:client/features/profile/domain/entities/lifter_overview.dart';
import 'package:client/features/profile/domain/entities/lifter_stats.dart';
import 'package:client/features/profile/domain/entities/record_lift.dart';
import 'package:client/features/profile/domain/entities/user_profile.dart';
import 'package:client/features/profile/domain/services/one_rep_max.dart';
import 'package:client/features/profile/domain/services/strength_standards.dart';
import 'package:client/features/workout_logging/domain/entities/performed_session.dart';

/// Derives the Profile read model from the stored profile and the complete
/// workout history. Pure — same inputs always produce the same overview —
/// so it is trivially testable and can run on every database change.
///
/// Two principles govern it:
///  * Only completed sets count. A planned set that was never finished is
///    not evidence of strength.
///  * Manual PRs and logged sets compete honestly: whichever estimates the
///    higher one-rep max becomes the record for that lift.
class BuildLifterOverview {
  const BuildLifterOverview();

  LifterOverview call({
    required UserProfile profile,
    required List<PerformedSession> sessions,
  }) {
    final records = _buildRecords(profile, sessions);
    final assessment = StrengthStandards.assess(
      records: records,
      bodyWeightLbs: profile.bodyWeightLbs,
    );

    return LifterOverview(
      profile: profile,
      records: records,
      assessment: assessment,
      sbdTotal: _buildSbdTotal(records, profile.bodyWeightLbs),
      stats: _buildStats(sessions),
    );
  }

  // ---------------------------------------------------------------------
  // Personal records
  // ---------------------------------------------------------------------

  List<LiftRecord> _buildRecords(
    UserProfile profile,
    List<PerformedSession> sessions,
  ) {
    // Best logged effort per tracked lift, judged by estimated 1RM.
    final logged = <RecordLift, LiftRecord>{};

    for (final session in sessions) {
      for (final exercise in session.performedExercise) {
        final lift = RecordLift.fromExercise(
          exId: exercise.exId,
          name: exercise.exerciseName,
        );
        if (lift == null) continue;

        for (final set in exercise.sets) {
          if (!set.isCompleted) continue;
          final oneRm = estimateOneRepMax(
            weightLbs: set.actWeight,
            reps: set.actRep,
          );
          if (oneRm <= 0) continue;

          final current = logged[lift];
          if (current == null || oneRm > current.estimatedOneRmLbs) {
            logged[lift] = LiftRecord(
              lift: lift,
              weightLbs: set.actWeight,
              reps: set.actRep,
              estimatedOneRmLbs: oneRm,
              achievedAt: session.endTime,
              fromLog: true,
            );
          }
        }
      }
    }

    final records = <LiftRecord>[];
    for (final lift in RecordLift.values) {
      final fromLog = logged[lift];
      final manualLbs = profile.manualPrLbs[lift];
      final manual = manualLbs == null || manualLbs <= 0
          ? null
          : LiftRecord(
              lift: lift,
              weightLbs: manualLbs,
              reps: 1,
              estimatedOneRmLbs: manualLbs,
              achievedAt: null,
              fromLog: false,
            );

      final best = _strongerOf(fromLog, manual);
      if (best != null) records.add(best);
    }
    return records;
  }

  LiftRecord? _strongerOf(LiftRecord? a, LiftRecord? b) {
    if (a == null) return b;
    if (b == null) return a;
    return a.estimatedOneRmLbs >= b.estimatedOneRmLbs ? a : b;
  }

  SbdTotal? _buildSbdTotal(List<LiftRecord> records, double bodyWeightLbs) {
    LiftRecord? find(RecordLift lift) {
      for (final record in records) {
        if (record.lift == lift) return record;
      }
      return null;
    }

    final squat = find(RecordLift.squat);
    final bench = find(RecordLift.benchPress);
    final deadlift = find(RecordLift.deadlift);
    if (squat == null || bench == null || deadlift == null) return null;
    if (bodyWeightLbs <= 0) return null;

    final total = squat.estimatedOneRmLbs +
        bench.estimatedOneRmLbs +
        deadlift.estimatedOneRmLbs;

    return SbdTotal(
      totalLbs: total,
      squatLbs: squat.estimatedOneRmLbs,
      benchLbs: bench.estimatedOneRmLbs,
      deadliftLbs: deadlift.estimatedOneRmLbs,
      bodyweightRatio: total / bodyWeightLbs,
    );
  }

  // ---------------------------------------------------------------------
  // Lifetime stats
  // ---------------------------------------------------------------------

  LifterStats _buildStats(List<PerformedSession> sessions) {
    if (sessions.isEmpty) return LifterStats.empty;

    final chronological = [...sessions]
      ..sort((a, b) => a.endTime.compareTo(b.endTime));

    var totalVolume = 0.0;
    var totalSeconds = 0;
    var totalSets = 0;
    var totalReps = 0;
    final setsByExercise = <String, int>{};
    final displayNameByExercise = <String, String>{};
    // First and best estimated 1RM per exercise, for improvement tracking.
    final firstOneRm = <String, double>{};
    final bestOneRm = <String, double>{};
    final trainingWeeks = <DateTime>{};

    for (final session in chronological) {
      totalSeconds += session.performedStats.totalSeconds;
      trainingWeeks.add(_weekStart(session.endTime));

      for (final exercise in session.performedExercise) {
        final key = exercise.exId.isNotEmpty
            ? exercise.exId
            : exercise.exerciseName.trim().toLowerCase();

        var sessionBestOneRm = 0.0;
        for (final set in exercise.sets) {
          if (!set.isCompleted) continue;
          totalSets++;
          totalReps += set.actRep;
          totalVolume += set.actWeight * set.actRep;
          setsByExercise[key] = (setsByExercise[key] ?? 0) + 1;
          displayNameByExercise[key] = exercise.exerciseName;

          final oneRm = estimateOneRepMax(
            weightLbs: set.actWeight,
            reps: set.actRep,
          );
          if (oneRm > sessionBestOneRm) sessionBestOneRm = oneRm;
        }

        if (sessionBestOneRm > 0) {
          firstOneRm.putIfAbsent(key, () => sessionBestOneRm);
          if (sessionBestOneRm > (bestOneRm[key] ?? 0)) {
            bestOneRm[key] = sessionBestOneRm;
          }
        }
      }
    }

    final firstWorkout = chronological.first.endTime;
    final weeksTraining =
        DateTime.now().difference(firstWorkout).inDays / 7.0;

    String? favorite;
    var favoriteSets = 0;
    setsByExercise.forEach((key, count) {
      if (count > favoriteSets) {
        favoriteSets = count;
        favorite = displayNameByExercise[key];
      }
    });

    return LifterStats(
      totalWorkouts: chronological.length,
      totalVolumeLbs: totalVolume,
      totalSeconds: totalSeconds,
      totalSets: totalSets,
      totalReps: totalReps,
      avgWorkoutsPerWeek: weeksTraining < 1
          ? chronological.length.toDouble()
          : chronological.length / weeksTraining,
      longestWeekStreak: _longestWeekStreak(trainingWeeks),
      favoriteLift: favorite,
      mostImproved: _mostImproved(
        firstOneRm,
        bestOneRm,
        setsByExercise,
        displayNameByExercise,
      ),
      firstWorkoutAt: firstWorkout,
    );
  }

  /// The exercise whose estimated 1RM grew the most, first session vs best.
  /// Needs a meaningful base: at least 6 completed sets and a real gain.
  MostImprovedLift? _mostImproved(
    Map<String, double> firstOneRm,
    Map<String, double> bestOneRm,
    Map<String, int> setsByExercise,
    Map<String, String> displayNameByExercise,
  ) {
    const minSets = 6;
    MostImprovedLift? best;
    var bestGain = 0.0;

    firstOneRm.forEach((key, first) {
      final peak = bestOneRm[key] ?? 0;
      if ((setsByExercise[key] ?? 0) < minSets) return;
      if (first <= 0 || peak <= first) return;
      final gain = (peak - first) / first;
      if (gain > bestGain) {
        bestGain = gain;
        best = MostImprovedLift(
          exerciseName: displayNameByExercise[key] ?? key,
          firstOneRmLbs: first,
          bestOneRmLbs: peak,
        );
      }
    });
    return best;
  }

  DateTime _weekStart(DateTime date) {
    return DateTime(date.year, date.month, date.day - (date.weekday - 1));
  }

  int _longestWeekStreak(Set<DateTime> weeks) {
    var longest = 0;
    for (final week in weeks) {
      final previous = DateTime(week.year, week.month, week.day - 7);
      if (weeks.contains(previous)) continue; // not the start of a run

      var length = 0;
      var cursor = week;
      while (weeks.contains(cursor)) {
        length++;
        cursor = DateTime(cursor.year, cursor.month, cursor.day + 7);
      }
      if (length > longest) longest = length;
    }
    return longest;
  }
}

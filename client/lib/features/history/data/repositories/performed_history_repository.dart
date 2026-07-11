import 'package:client/features/history/domain/entities/history_overview.dart';
import 'package:client/features/history/domain/repositories/history_repository.dart';
import 'package:client/features/workout_logging/domain/entities/performed_exercise.dart';
import 'package:client/features/workout_logging/domain/entities/performed_session.dart';
import 'package:client/features/workout_logging/domain/entities/performed_set.dart';
import 'package:client/features/workout_logging/domain/repositories/performed_workout_repository.dart';

/// Real history source: computes the [HistoryOverview] read model from the
/// performed sessions stored in Isar.
///
/// Every value the History page shows is derived here from actual logged
/// sets — nothing is estimated or fabricated. Records are detected by
/// replaying sessions in chronological order: a completed set that beats an
/// exercise's previous best weight counts as a record, while the first time
/// an exercise is ever performed only sets the baseline.
class PerformedHistoryRepository implements HistoryRepository {
  final PerformedWorkoutRepository performedWorkoutRepository;

  PerformedHistoryRepository(this.performedWorkoutRepository);

  /// How far back the weekly volume chart may reach.
  static const int _maxChartWeeks = 8;

  /// How many recent personal records to surface at the top of the page.
  static const int _maxRecentRecords = 6;

  @override
  Stream<HistoryOverview> watchHistoryOverview() {
    return performedWorkoutRepository.watchAllPerformedSession().map(
      _buildOverview,
    );
  }

  HistoryOverview _buildOverview(List<PerformedSession> performedSessions) {
    final chronological = [...performedSessions]
      ..sort((a, b) => a.endTime.compareTo(b.endTime));

    // Best completed weight seen so far per exercise, for record detection.
    final bestWeightByExercise = <String, double>{};
    // Latest record hit per exercise, overwritten as heavier ones land.
    final latestRecordByExercise = <String, RecordHighlight>{};
    final summaries = <HistorySessionSummary>[];

    for (final session in chronological) {
      summaries.add(
        _summarizeSession(
          session,
          bestWeightByExercise,
          latestRecordByExercise,
        ),
      );
    }

    final now = DateTime.now();
    final currentWeekStart = _weekStart(now);

    var workoutsThisWeek = 0;
    var volumeThisWeek = 0.0;
    var secondsThisWeek = 0;
    final volumeByWeek = <DateTime, double>{};
    final workoutDays = <DateTime>{};

    for (final summary in summaries) {
      final week = _weekStart(summary.endTime);
      volumeByWeek[week] = (volumeByWeek[week] ?? 0) + summary.totalVolume;
      workoutDays.add(_dayStart(summary.endTime));
      if (week == currentWeekStart) {
        workoutsThisWeek++;
        volumeThisWeek += summary.totalVolume;
        secondsThisWeek += summary.durationSeconds;
      }
    }

    final recentRecords = latestRecordByExercise.values.toList()
      ..sort((a, b) => b.achievedAt.compareTo(a.achievedAt));

    final streakDetail = _streakDaysDetailed(workoutDays, _dayStart(now));

    return HistoryOverview(
      totalWorkouts: summaries.length,
      workoutsThisWeek: workoutsThisWeek,
      volumeThisWeek: volumeThisWeek,
      secondsThisWeek: secondsThisWeek,
      currentStreakWeeks: _streakWeeks(volumeByWeek.keys, currentWeekStart),
      currentStreakDays: streakDetail.count,
      workoutDays: workoutDays,
      streakDayIndexByDate: streakDetail.indexByDate,
      weeklyVolume: _weeklyVolume(volumeByWeek, currentWeekStart),
      sessions: summaries.reversed.toList(),
      recentRecords: recentRecords.take(_maxRecentRecords).toList(),
    );
  }

  HistorySessionSummary _summarizeSession(
    PerformedSession session,
    Map<String, double> bestWeightByExercise,
    Map<String, RecordHighlight> latestRecordByExercise,
  ) {
    final exerciseSummaries = <SessionExerciseSummary>[];
    var sessionVolume = 0.0;
    var sessionCompletedSets = 0;
    var recordCount = 0;

    for (final exercise in session.performedExercise) {
      final completedSets = exercise.sets
          .where((set) => set.isCompleted)
          .toList();
      if (completedSets.isEmpty) continue;

      sessionCompletedSets += completedSets.length;
      for (final set in completedSets) {
        sessionVolume += set.actWeight * set.actRep;
      }

      final topSet = _topSet(completedSets);
      final key = _exerciseKey(exercise);
      final previousBest = bestWeightByExercise[key];
      final isRecord = previousBest != null && topSet.actWeight > previousBest;
      if (isRecord) {
        recordCount++;
        latestRecordByExercise[key] = RecordHighlight(
          exerciseName: exercise.exerciseName,
          weight: topSet.actWeight,
          reps: topSet.actRep,
          achievedAt: session.endTime,
        );
      }
      if (previousBest == null || topSet.actWeight > previousBest) {
        bestWeightByExercise[key] = topSet.actWeight;
      }

      exerciseSummaries.add(
        SessionExerciseSummary(
          name: exercise.exerciseName,
          completedSets: completedSets.length,
          topWeight: topSet.actWeight,
          topReps: topSet.actRep,
          isRecord: isRecord,
          notes: exercise.notes,
        ),
      );
    }

    return HistorySessionSummary(
      name: session.name,
      endTime: session.endTime,
      durationSeconds: session.performedStats.totalSeconds,
      totalVolume: sessionVolume,
      completedSets: sessionCompletedSets,
      recordCount: recordCount,
      exercises: exerciseSummaries,
    );
  }

  /// Heaviest completed set; reps break ties.
  PerformedSet _topSet(List<PerformedSet> completedSets) {
    return completedSets.reduce((best, set) {
      if (set.actWeight > best.actWeight) return set;
      if (set.actWeight == best.actWeight && set.actRep > best.actRep) {
        return set;
      }
      return best;
    });
  }

  String _exerciseKey(PerformedExercise exercise) {
    return exercise.exId.isNotEmpty
        ? exercise.exId
        : exercise.exerciseName.trim().toLowerCase();
  }

  /// Midnight of the calendar day containing [date].
  DateTime _dayStart(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// Number of days trained in the current streak, counting back from today.
  ///
  /// The streak survives short rest gaps — rest days are expected in a
  /// powerlifting program — and only resets after 3 consecutive days with no
  /// workout, matching the rule shown on the streak card. Days that were
  /// actually trained are what get counted, so the rest gaps in between don't
  /// inflate the number.
  static const int _restDaysBeforeReset = 3;

  /// Same walk as the doc above, but also records each trained day's
  /// 1-based position within the streak (earliest = 1), so the UI can
  /// recolor the activity grid by milestone as the streak grows.
  ({int count, Map<DateTime, int> indexByDate}) _streakDaysDetailed(
    Set<DateTime> daysWithWorkout,
    DateTime today,
  ) {
    if (daysWithWorkout.isEmpty) return (count: 0, indexByDate: {});

    final earliest = daysWithWorkout.reduce((a, b) => a.isBefore(b) ? a : b);
    var streak = 0;
    var restGap = 0;
    var cursor = today;
    // Trained days encountered walking backward from today, so the first
    // entry is the most recent day and the last is the streak's start.
    final trainedNewestFirst = <DateTime>[];

    while (!cursor.isBefore(earliest)) {
      if (daysWithWorkout.contains(cursor)) {
        streak++;
        restGap = 0;
        trainedNewestFirst.add(cursor);
      } else {
        restGap++;
        if (restGap >= _restDaysBeforeReset) break;
      }
      cursor = _previousDay(cursor);
    }

    final indexByDate = <DateTime, int>{
      for (var i = 0; i < trainedNewestFirst.length; i++)
        trainedNewestFirst[i]: streak - i,
    };
    return (count: streak, indexByDate: indexByDate);
  }

  DateTime _previousDay(DateTime day) {
    return DateTime(day.year, day.month, day.day - 1);
  }

  /// Monday of the calendar week containing [date], at midnight.
  DateTime _weekStart(DateTime date) {
    return DateTime(date.year, date.month, date.day - (date.weekday - 1));
  }

  /// Consecutive weeks with a workout, counting back from the current week.
  /// The current week only counts once it has a workout, but an empty week
  /// in progress does not break a streak built up before it.
  int _streakWeeks(Iterable<DateTime> weeksWithWorkout, DateTime currentWeek) {
    final weeks = weeksWithWorkout.toSet();
    var cursor = weeks.contains(currentWeek)
        ? currentWeek
        : _previousWeek(currentWeek);
    var streak = 0;
    while (weeks.contains(cursor)) {
      streak++;
      cursor = _previousWeek(cursor);
    }
    return streak;
  }

  DateTime _previousWeek(DateTime weekStart) {
    return DateTime(weekStart.year, weekStart.month, weekStart.day - 7);
  }

  /// Continuous weekly volume series ending at the current week. Weeks
  /// without training show as zero, but the series never starts before the
  /// user's first recorded workout.
  List<WeeklyVolume> _weeklyVolume(
    Map<DateTime, double> volumeByWeek,
    DateTime currentWeek,
  ) {
    if (volumeByWeek.isEmpty) return const [];

    var firstWeek = volumeByWeek.keys.reduce(
      (a, b) => a.isBefore(b) ? a : b,
    );
    final chartFloor = DateTime(
      currentWeek.year,
      currentWeek.month,
      currentWeek.day - 7 * (_maxChartWeeks - 1),
    );
    if (firstWeek.isBefore(chartFloor)) firstWeek = chartFloor;

    final series = <WeeklyVolume>[];
    var cursor = firstWeek;
    while (!cursor.isAfter(currentWeek)) {
      series.add(
        WeeklyVolume(weekStart: cursor, volume: volumeByWeek[cursor] ?? 0),
      );
      cursor = DateTime(cursor.year, cursor.month, cursor.day + 7);
    }
    return series;
  }
}

import 'package:client/features/profile/domain/entities/lift_record.dart';
import 'package:client/features/profile/domain/entities/record_lift.dart';
import 'package:client/features/profile/domain/entities/strength_level.dart';

/// Grades lifts against widely used lift-to-bodyweight strength standards.
///
/// Each competition lift has five ratio thresholds marking the entry point
/// of Novice, Beginner, Intermediate, Advanced and Elite. Below the first
/// threshold a lift is Untrained. The thresholds are deliberately simple —
/// bodyweight multiples a lifter can reason about — rather than an opaque
/// points formula. A score is interpolated linearly between thresholds so
/// progress toward the next level is visible, not just the level itself.
///
/// The overall classification is the average score of the competition
/// lifts that have data: a lifter is as strong as their whole total, and a
/// lagging lift honestly drags the verdict down.
class StrengthStandards {
  StrengthStandards._();

  /// Ratio thresholds per lift: [novice, beginner, intermediate, advanced,
  /// elite]. Unisex approximations of published barbell standards.
  static const Map<RecordLift, List<double>> _thresholds = {
    RecordLift.squat: [0.75, 1.00, 1.50, 2.00, 2.50],
    RecordLift.benchPress: [0.50, 0.75, 1.10, 1.50, 1.90],
    RecordLift.deadlift: [1.00, 1.25, 1.75, 2.25, 2.75],
    RecordLift.overheadPress: [0.35, 0.50, 0.70, 0.90, 1.10],
  };

  static bool hasStandardsFor(RecordLift lift) =>
      _thresholds.containsKey(lift);

  /// Grades a single lift. Returns null when the lift has no published
  /// standards or the inputs cannot be graded.
  static LiftStrength? assessLift({
    required RecordLift lift,
    required double oneRmLbs,
    required double bodyWeightLbs,
  }) {
    final thresholds = _thresholds[lift];
    if (thresholds == null || bodyWeightLbs <= 0 || oneRmLbs <= 0) {
      return null;
    }

    final ratio = oneRmLbs / bodyWeightLbs;
    final score = _scoreForRatio(ratio, thresholds);
    final level = _levelForScore(score);
    final next = level.next;

    return LiftStrength(
      lift: lift,
      oneRmLbs: oneRmLbs,
      bodyweightRatio: ratio,
      level: level,
      score: score,
      lbsToNextLevel: next == null
          ? null
          : thresholds[next.index - 1] * bodyWeightLbs - oneRmLbs,
    );
  }

  /// Grades the lifter overall from their competition-lift records.
  /// Returns null when no competition lift has a record yet.
  static StrengthAssessment? assess({
    required List<LiftRecord> records,
    required double bodyWeightLbs,
  }) {
    final lifts = <LiftStrength>[];
    for (final record in records) {
      if (!record.lift.isCompetitionLift) continue;
      final graded = assessLift(
        lift: record.lift,
        oneRmLbs: record.estimatedOneRmLbs,
        bodyWeightLbs: bodyWeightLbs,
      );
      if (graded != null) lifts.add(graded);
    }
    if (lifts.isEmpty) return null;

    final score =
        lifts.map((l) => l.score).reduce((a, b) => a + b) / lifts.length;
    final level = _levelForScore(score);

    final byScore = [...lifts]..sort((a, b) => b.score.compareTo(a.score));

    return StrengthAssessment(
      level: level,
      score: score,
      progressToNext: level.isMax ? 1.0 : score - score.floorToDouble(),
      lifts: byScore,
      weakest: byScore.last,
    );
  }

  /// Maps a bodyweight ratio onto the continuous 0–5 scale, interpolating
  /// linearly between thresholds. 1.0 lands exactly on Novice, 5.0 on Elite.
  static double _scoreForRatio(double ratio, List<double> thresholds) {
    if (ratio <= 0) return 0;
    if (ratio >= thresholds.last) return 5;
    if (ratio < thresholds.first) return ratio / thresholds.first;

    for (var i = thresholds.length - 1; i >= 1; i--) {
      if (ratio >= thresholds[i - 1]) {
        final span = thresholds[i] - thresholds[i - 1];
        return i + (ratio - thresholds[i - 1]) / span;
      }
    }
    return 0;
  }

  static StrengthLevel _levelForScore(double score) {
    final index = score.floor().clamp(0, StrengthLevel.values.length - 1);
    return StrengthLevel.values[index];
  }
}

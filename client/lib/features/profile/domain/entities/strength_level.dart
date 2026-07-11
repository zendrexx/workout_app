import 'package:client/features/profile/domain/entities/record_lift.dart';

/// Strength classification derived from lift-to-bodyweight ratios.
/// Order matters: the index is the rank.
enum StrengthLevel {
  untrained,
  novice,
  beginner,
  intermediate,
  advanced,
  elite;

  String get displayName {
    switch (this) {
      case StrengthLevel.untrained:
        return 'Untrained';
      case StrengthLevel.novice:
        return 'Novice';
      case StrengthLevel.beginner:
        return 'Beginner';
      case StrengthLevel.intermediate:
        return 'Intermediate';
      case StrengthLevel.advanced:
        return 'Advanced';
      case StrengthLevel.elite:
        return 'Elite';
    }
  }

  bool get isMax => this == StrengthLevel.elite;

  StrengthLevel? get next =>
      isMax ? null : StrengthLevel.values[index + 1];
}

/// One lift's contribution to the classification.
class LiftStrength {
  final RecordLift lift;

  /// Estimated one-rep max used for the assessment (canonical lbs).
  final double oneRmLbs;

  /// [oneRmLbs] divided by bodyweight — the number the standards grade.
  final double bodyweightRatio;

  final StrengthLevel level;

  /// Continuous position on the standards scale, 0.0 (nothing) to 5.0
  /// (elite threshold). The integer part is the level index minus nothing —
  /// e.g. 3.4 is 40% of the way from intermediate to advanced.
  final double score;

  /// Pounds to add to the estimated max to reach the next level.
  /// Null once the lift is elite.
  final double? lbsToNextLevel;

  const LiftStrength({
    required this.lift,
    required this.oneRmLbs,
    required this.bodyweightRatio,
    required this.level,
    required this.score,
    required this.lbsToNextLevel,
  });
}

/// The overall verdict: how strong this lifter is right now, why, and what
/// stands between them and the next level.
class StrengthAssessment {
  final StrengthLevel level;

  /// Average of the competition-lift scores, 0.0–5.0.
  final double score;

  /// Progress from [level] toward the next one, 0.0–1.0. Pinned to 1.0 at
  /// elite.
  final double progressToNext;

  /// The competition lifts that had data, strongest first.
  final List<LiftStrength> lifts;

  /// The lift holding the classification back — the natural next focus.
  final LiftStrength weakest;

  const StrengthAssessment({
    required this.level,
    required this.score,
    required this.progressToNext,
    required this.lifts,
    required this.weakest,
  });

  /// Competition lifts with no record yet; adding them sharpens the
  /// assessment.
  List<RecordLift> get missingLifts => RecordLift.values
      .where((lift) => lift.isCompetitionLift)
      .where((lift) => !lifts.any((l) => l.lift == lift))
      .toList();
}

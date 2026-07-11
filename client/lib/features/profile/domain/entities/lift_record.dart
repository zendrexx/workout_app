import 'package:client/features/profile/domain/entities/record_lift.dart';

/// The best a lifter has ever done on one lift.
///
/// Comes from a logged top set or a manually entered max — whichever
/// estimates the higher one-rep max. Never fabricated: a lift without data
/// simply has no record.
class LiftRecord {
  final RecordLift lift;

  /// Heaviest weight actually handled (canonical lbs).
  final double weightLbs;

  /// Reps performed at [weightLbs]. Manual maxes count as a single.
  final int reps;

  /// Estimated one-rep max derived from weight and reps (Epley).
  final double estimatedOneRmLbs;

  /// When the record was set. Null for manual entries, which carry no date.
  final DateTime? achievedAt;

  /// True when the record was earned in a logged workout rather than typed
  /// in during setup.
  final bool fromLog;

  const LiftRecord({
    required this.lift,
    required this.weightLbs,
    required this.reps,
    required this.estimatedOneRmLbs,
    required this.achievedAt,
    required this.fromLog,
  });
}

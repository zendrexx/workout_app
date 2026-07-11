import 'package:client/features/profile/domain/entities/lift_record.dart';
import 'package:client/features/profile/domain/entities/lifter_stats.dart';
import 'package:client/features/profile/domain/entities/record_lift.dart';
import 'package:client/features/profile/domain/entities/strength_level.dart';
import 'package:client/features/profile/domain/entities/user_profile.dart';

/// The estimated powerlifting total: squat + bench + deadlift one-rep
/// maxes. Only exists once all three lifts have a record.
class SbdTotal {
  final double totalLbs;
  final double squatLbs;
  final double benchLbs;
  final double deadliftLbs;

  /// Total relative to bodyweight — the honest measure of relative strength.
  final double bodyweightRatio;

  const SbdTotal({
    required this.totalLbs,
    required this.squatLbs,
    required this.benchLbs,
    required this.deadliftLbs,
    required this.bodyweightRatio,
  });

  double get squatShare => squatLbs / totalLbs;
  double get benchShare => benchLbs / totalLbs;
  double get deadliftShare => deadliftLbs / totalLbs;
}

/// Everything the Profile page shows — a read model answering
/// "who am I as a lifter?". Each value is computed from the stored profile
/// and real performed sessions; nothing here is invented.
class LifterOverview {
  final UserProfile profile;

  /// Best effort per tracked lift, in [RecordLift] display order. Lifts
  /// without any data are simply absent.
  final List<LiftRecord> records;

  /// Null until at least one competition lift has a record.
  final StrengthAssessment? assessment;

  /// Null until squat, bench and deadlift all have records.
  final SbdTotal? sbdTotal;

  final LifterStats stats;

  const LifterOverview({
    required this.profile,
    required this.records,
    required this.assessment,
    required this.sbdTotal,
    required this.stats,
  });

  LiftRecord? recordFor(RecordLift lift) {
    for (final record in records) {
      if (record.lift == lift) return record;
    }
    return null;
  }

  /// Supporting lifts (non-competition) that earned a record from logs.
  List<LiftRecord> get supportingRecords =>
      records.where((r) => !r.lift.isCompetitionLift).toList();
}

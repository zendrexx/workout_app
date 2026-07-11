import 'package:client/features/profile/domain/entities/record_lift.dart';
import 'package:client/features/profile/domain/entities/weight_unit.dart';

/// The lifter's locally stored identity. Created once during profile setup
/// and editable afterwards. Everything lives on the device — no account.
class UserProfile {
  /// Empty until the user names themselves; the UI shows a placeholder.
  final String displayName;

  /// Short self-description, empty when unset.
  final String bio;

  /// Reserved for a future profile picture; no picker ships yet.
  final String? avatarPath;

  final double heightCm;
  final double bodyWeightLbs;
  final WeightUnit unit;

  /// One-rep maxes the user entered by hand (canonical lbs). Only lifts in
  /// [RecordLift.supportsManualEntry] may appear. Logged sets can overtake
  /// these, but manual entries are never silently discarded.
  final Map<RecordLift, double> manualPrLbs;

  final DateTime createdAt;

  const UserProfile({
    required this.displayName,
    required this.bio,
    required this.avatarPath,
    required this.heightCm,
    required this.bodyWeightLbs,
    required this.unit,
    required this.manualPrLbs,
    required this.createdAt,
  });

  bool get hasDisplayName => displayName.trim().isNotEmpty;
  bool get hasBio => bio.trim().isNotEmpty;

  UserProfile copyWith({
    String? displayName,
    String? bio,
    String? avatarPath,
    double? heightCm,
    double? bodyWeightLbs,
    WeightUnit? unit,
    Map<RecordLift, double>? manualPrLbs,
  }) {
    return UserProfile(
      displayName: displayName ?? this.displayName,
      bio: bio ?? this.bio,
      avatarPath: avatarPath ?? this.avatarPath,
      heightCm: heightCm ?? this.heightCm,
      bodyWeightLbs: bodyWeightLbs ?? this.bodyWeightLbs,
      unit: unit ?? this.unit,
      manualPrLbs: manualPrLbs ?? this.manualPrLbs,
      createdAt: createdAt,
    );
  }
}

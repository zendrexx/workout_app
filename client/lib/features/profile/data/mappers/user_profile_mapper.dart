import 'package:client/features/profile/data/models/user_profile_isar.dart';
import 'package:client/features/profile/domain/entities/record_lift.dart';
import 'package:client/features/profile/domain/entities/user_profile.dart';
import 'package:client/features/profile/domain/entities/weight_unit.dart';

UserProfile toDomainUserProfile(UserProfileIsar isar) {
  final manualPrLbs = <RecordLift, double>{
    if (isar.manualSquatLbs != null)
      RecordLift.squat: isar.manualSquatLbs!,
    if (isar.manualBenchLbs != null)
      RecordLift.benchPress: isar.manualBenchLbs!,
    if (isar.manualDeadliftLbs != null)
      RecordLift.deadlift: isar.manualDeadliftLbs!,
    if (isar.manualOverheadPressLbs != null)
      RecordLift.overheadPress: isar.manualOverheadPressLbs!,
  };

  return UserProfile(
    displayName: isar.displayName,
    bio: isar.bio,
    avatarPath: isar.avatarPath,
    heightCm: isar.heightCm,
    bodyWeightLbs: isar.bodyWeightLbs,
    unit: WeightUnit.values.firstWhere(
      (unit) => unit.name == isar.unitName,
      orElse: () => WeightUnit.lbs,
    ),
    manualPrLbs: manualPrLbs,
    createdAt: isar.createdAt,
  );
}

UserProfileIsar toIsarUserProfile(UserProfile profile) {
  return UserProfileIsar()
    ..id = UserProfileIsar.singletonId
    ..displayName = profile.displayName
    ..bio = profile.bio
    ..avatarPath = profile.avatarPath
    ..heightCm = profile.heightCm
    ..bodyWeightLbs = profile.bodyWeightLbs
    ..unitName = profile.unit.name
    ..manualSquatLbs = profile.manualPrLbs[RecordLift.squat]
    ..manualBenchLbs = profile.manualPrLbs[RecordLift.benchPress]
    ..manualDeadliftLbs = profile.manualPrLbs[RecordLift.deadlift]
    ..manualOverheadPressLbs = profile.manualPrLbs[RecordLift.overheadPress]
    ..createdAt = profile.createdAt;
}

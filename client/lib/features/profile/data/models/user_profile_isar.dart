import 'package:isar/isar.dart';

part 'user_profile_isar.g.dart';

/// Local persistence of the lifter's profile. A singleton row: there is
/// exactly one lifter per device, so the id is fixed.
@collection
class UserProfileIsar {
  static const int singletonId = 0;

  Id id = singletonId;

  String displayName = "";

  String bio = "";

  String? avatarPath;

  double heightCm = 0;

  double bodyWeightLbs = 0;

  /// Stored as the [WeightUnit] enum name ("lbs" / "kg") so reordering the
  /// enum can never corrupt saved data.
  String unitName = "lbs";

  // Manually entered one-rep maxes, canonical lbs. Null = never entered.
  double? manualSquatLbs;
  double? manualBenchLbs;
  double? manualDeadliftLbs;
  double? manualOverheadPressLbs;

  DateTime createdAt = DateTime.fromMillisecondsSinceEpoch(0);
}

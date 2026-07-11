import 'package:client/features/profile/domain/entities/user_profile.dart';

/// Local source of truth for the lifter's profile.
///
/// Emits null until setup has been completed — that is how the app knows to
/// show onboarding. A future cloud-sync implementation only has to honor
/// this same contract.
abstract class ProfileRepository {
  Stream<UserProfile?> watchProfile();
  Future<void> saveProfile(UserProfile profile);
}

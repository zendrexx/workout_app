import 'package:client/features/profile/data/mappers/user_profile_mapper.dart';
import 'package:client/features/profile/data/models/user_profile_isar.dart';
import 'package:client/features/profile/domain/entities/user_profile.dart';
import 'package:client/features/profile/domain/repositories/profile_repository.dart';
import 'package:isar/isar.dart';

/// Offline-first profile store backed by Isar. Emits null until the lifter
/// completes setup, then re-emits on every edit.
class IsarProfileRepository implements ProfileRepository {
  final Isar isar;

  IsarProfileRepository(this.isar);

  @override
  Stream<UserProfile?> watchProfile() {
    return isar.userProfileIsars
        .watchObject(UserProfileIsar.singletonId, fireImmediately: true)
        .map((row) => row == null ? null : toDomainUserProfile(row));
  }

  @override
  Future<void> saveProfile(UserProfile profile) async {
    final row = toIsarUserProfile(profile);
    await isar.writeTxn(() => isar.userProfileIsars.put(row));
  }
}

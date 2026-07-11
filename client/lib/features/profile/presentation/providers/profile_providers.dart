import 'package:client/core/database/database_service.dart';
import 'package:client/features/profile/data/repositories/isar_profile_repository.dart';
import 'package:client/features/profile/domain/entities/lifter_overview.dart';
import 'package:client/features/profile/domain/entities/user_profile.dart';
import 'package:client/features/profile/domain/repositories/profile_repository.dart';
import 'package:client/features/profile/domain/usecases/build_lifter_overview.dart';
import 'package:client/features/workout_logging/domain/entities/performed_session.dart';
import 'package:client/features/workout_logging/presentation/providers/watch_all_performed_session_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final isar = ref.watch(isarProvider).requireValue;
  return IsarProfileRepository(isar);
});

/// The stored profile. Null means setup has not been completed yet, which
/// is what makes the Profile tab show onboarding.
final userProfileProvider = StreamProvider<UserProfile?>((ref) {
  return ref.watch(profileRepositoryProvider).watchProfile();
});

final _performedSessionsProvider =
    StreamProvider.autoDispose<List<PerformedSession>>((ref) {
  return ref.read(watchallPerformedSessionProvider).call();
});

/// Live read model for the Profile page: recomputed whenever the profile
/// is edited or a workout is logged. Null data means "no profile yet".
final lifterOverviewProvider =
    Provider.autoDispose<AsyncValue<LifterOverview?>>((ref) {
  final profileAsync = ref.watch(userProfileProvider);
  final sessionsAsync = ref.watch(_performedSessionsProvider);

  if (profileAsync.hasError) {
    return AsyncValue.error(profileAsync.error!, profileAsync.stackTrace!);
  }
  if (sessionsAsync.hasError) {
    return AsyncValue.error(sessionsAsync.error!, sessionsAsync.stackTrace!);
  }
  if (profileAsync.isLoading || sessionsAsync.isLoading) {
    return const AsyncValue.loading();
  }

  final profile = profileAsync.value;
  if (profile == null) return const AsyncValue.data(null);

  return AsyncValue.data(
    const BuildLifterOverview()(
      profile: profile,
      sessions: sessionsAsync.value ?? const [],
    ),
  );
});

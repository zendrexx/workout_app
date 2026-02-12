import 'package:client/features/workout_logging/domain/usecases/watch_all_performed_session.dart';
import 'package:client/features/workout_logging/presentation/providers/performed_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final watchallPerformedSessionProvider = Provider<WatchAllPerformedSession>((
  ref,
) {
  final repo = ref.read(performedRepositoryProvider);

  return WatchAllPerformedSession(repo);
});

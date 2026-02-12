import 'package:client/features/workout_planning/domain/usecases/watch_all_planned_session.dart';
import 'package:client/features/workout_planning/presentation/providers/planned_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final watchAllPlannedSessionsProvider = Provider<WatchAllPlannedSession>((ref) {
  final repo = ref.read(plannedRepositoryProvider);
  return WatchAllPlannedSession(repo);
});

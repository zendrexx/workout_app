import 'package:client/core/providers/planned_repo_provider.dart';
import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final plannedSessionProvider =
    StateNotifierProvider<
      PlannedSessionViewModel,
      AsyncValue<List<PlannedSession>>
    >((ref) => PlannedSessionViewModel(ref.read(plannedRepoProvider)));

class PlannedSessionViewModel
    extends StateNotifier<AsyncValue<List<PlannedSession>>> {
  final PlannedSessionAbstract repo;
  PlannedSessionViewModel(this.repo) : super(const AsyncLoading()) {
    loadSession();
  }

  Future<void> loadSession() async {
    try {
      final sessions = await repo.getAllPlannedSession();
      state = AsyncData(sessions);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

import 'package:client/features/home/presentation/providers/home_view_model_provider.dart';
import 'package:client/features/home/presentation/state/home_state.dart';
import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final visibleSessionsProvider = Provider<List<PlannedSessionState>>((ref) {
  final state = ref.watch(homeViewModelProvider);

  if (!state.isProgramMode || state.activeProgramId == null) {
    return state.session;
  }

  final program = state.program
      .where((p) => p.programSessionId == state.activeProgramId)
      .firstOrNull;

  if (program == null) return state.session;

  return program.programSessionIds
      .map((id) => state.session.firstWhere((s) => s.sessionId == id))
      .toList();
});

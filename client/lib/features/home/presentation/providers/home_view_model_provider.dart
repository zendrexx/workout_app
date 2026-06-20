import 'package:client/features/home/presentation/state/home_state.dart';
import 'package:client/features/home/presentation/viewmodel/home_view_model.dart';
import 'package:client/features/workout_planning/presentation/providers/delete_session_provider.dart';
import 'package:client/features/workout_planning/presentation/providers/duplicate_session_provider.dart';
import 'package:client/features/workout_planning/presentation/providers/watch_all_planned_session_provider.dart';
import 'package:client/features/workout_program/presentation/providers/delete_session_provider.dart';
import 'package:client/features/workout_program/presentation/providers/watch_all_program_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>((
  ref,
) {
  final getAllSession = ref.read(watchAllPlannedSessionsProvider);
  final deleteSession = ref.read(deleteSessionProvider);
  final duplicateSession = ref.read(duplicateSessionProvider);
  final getAllProgram = ref.read(watchAllProgramProvider);
  final deleteProgram = ref.read(deleteProgramProvider);
  // final duplicateProgram = ref.read(duplicateProgramProvider);
  return HomeViewModel(
    getAllSession,
    getAllProgram,
    deleteSession,
    duplicateSession,
    deleteProgram,
    // duplicateProgram,
  );
});

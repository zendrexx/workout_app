import 'package:client/features/workout_planning/presentation/providers/delete_session_provider.dart';
import 'package:client/features/workout_planning/presentation/providers/duplicate_session_provider.dart';
import 'package:client/features/workout_planning/presentation/providers/watch_all_planned_session_provider.dart';
import 'package:client/features/workout_program/presentation/providers/add_program_provider.dart';
import 'package:client/features/workout_program/presentation/state/program_state.dart';
import 'package:client/features/workout_program/presentation/viewmodel/program_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final programViewModelProvider =
    StateNotifierProvider.autoDispose<ProgramViewModel, ProgramState>((ref) {
      final getAllSession = ref.read(watchAllPlannedSessionsProvider);
      final addProgram = ref.read(addProgramProvider);
      // final deleteSession = ref.read();
      // final duplicateSession = ref.read();

      return ProgramViewModel(getAllSession, addProgram);
    });

import 'package:client/features/workout_planning/presentation/providers/get_session_by_id_provider.dart';
import 'package:client/features/workout_program/presentation/providers/add_program_provider.dart';
import 'package:client/features/workout_program/presentation/providers/get_program_by_id_provider.dart';
import 'package:client/features/workout_program/presentation/state/program_state.dart';
import 'package:client/features/workout_program/presentation/viewmodel/program_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final programViewModelProvider =
    StateNotifierProvider.autoDispose<ProgramViewModel, ProgramState>((ref) {
      final addProgram = ref.read(addProgramProvider);
      final getProgramById = ref.read(getProgramByIdProvider);
      final getSessionById = ref.read(getSessionByIdProvider);
      return ProgramViewModel(addProgram, getProgramById, getSessionById);
    });

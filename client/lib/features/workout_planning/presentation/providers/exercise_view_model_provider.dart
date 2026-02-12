import 'package:client/features/workout_planning/presentation/providers/get_all_exercise_provider.dart';
import 'package:client/core/presentation/state/exercise_list_state.dart';
import 'package:client/features/workout_planning/presentation/viewmodel/exercise_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseViewModelProvider =
    StateNotifierProvider<ExerciseViewModel, ExerciseListState>((ref) {
      final getAllExercise = ref.read(getAllExerciseProvider);

      return ExerciseViewModel(getAllExercise);
    });

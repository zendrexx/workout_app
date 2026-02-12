import 'package:client/features/workout_planning/domain/usecases/get_all_exercise.dart';
import 'package:client/core/presentation/state/exercise_list_state.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_state_exercise_list_mapper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseViewModel extends StateNotifier<ExerciseListState> {
  final GetAllExercise getAllExercise;
  ExerciseViewModel(this.getAllExercise) : super(ExerciseListState.initial()) {
    loadAllExercise();
  }

  Future<void> loadAllExercise() async {
    final exercises = await getAllExercise.call();
    print("Loaded exercises in ViewModel: ${exercises.length}");
    exercises.forEach((e) => print("Exercise: ${e.name}"));
    state = toExerciseListState(exercises);
  }
}

import 'package:client/features/workout_planning/domain/entities/exercise.dart';
import 'package:client/features/workout_planning/presentation/state/exercise_list_state.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_state_exercise_mapper.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_state_mapper.dart';

ExerciseListState toExerciseStateList(List<Exercise> exercises) {
  return ExerciseListState(
    exercises: exercises.map(toExerciseState).toList(),
    isLoading: false,
  );
}

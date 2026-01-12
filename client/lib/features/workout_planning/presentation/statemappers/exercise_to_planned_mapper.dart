import 'package:client/features/workout_planning/domain/entities/exercise.dart';
import 'package:client/features/workout_planning/presentation/state/exercise_state.dart';
import 'package:client/features/workout_planning/presentation/state/planned_exercise_state.dart';
import 'package:client/features/workout_planning/presentation/state/planned_set_state.dart';

PlannedExerciseState toPlannedExercise(ExerciseState ex) {
  return PlannedExerciseState(
    sets: [PlannedSetState.defaultSet()],
    equipment: ex.equipment ?? "",
    exerciseName: ex.name,
    imagePath: ex.imagePath,
    notes: "",
  );
}

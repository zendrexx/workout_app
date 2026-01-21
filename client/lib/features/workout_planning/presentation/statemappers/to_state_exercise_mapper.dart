import 'package:client/features/workout_planning/domain/entities/exercise.dart';
import 'package:client/core/presentation/state/exercise_state.dart';

ExerciseState toExerciseState(Exercise ex) {
  return ExerciseState(
    exId: ex.exId,
    name: ex.name,
    primMuscle: ex.primMuscle,
    imagePath: ex.imagePath,
    equipment: ex.equipment,
    seconMuscle: ex.seconMuscle,
  );
}

import 'package:client/core/presentation/state/exercise_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_exercise_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_set_state.dart';

PerformedExerciseState toPerformedExerciseState(
  ExerciseState ex,
  List<PerformedSetState> sets,
) {
  return PerformedExerciseState(
    exId: ex.exId,
    sets: sets.isNotEmpty ? sets : [PerformedSetState.defaultSet()],
    equipment: ex.equipment ?? "",
    exerciseName: ex.name,
    imagePath: ex.imagePath,
    notes: "",
  );
}

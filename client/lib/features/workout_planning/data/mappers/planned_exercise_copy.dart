import 'package:client/features/workout_planning/data/mappers/planned_set_copy.dart';
import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';

extension PlannedExerciseCopy on PlannedExerciseIsar {
  PlannedExerciseIsar deepCopy() {
    final copy = PlannedExerciseIsar(
      exId: exId,
      exerciseName: exerciseName,
      notes: notes,
      equipment: equipment,
      exercisePath: exercisePath,
    );

    for (final set in sets) {
      copy.sets.add(set.deepCopy());
    }

    return copy;
  }
}

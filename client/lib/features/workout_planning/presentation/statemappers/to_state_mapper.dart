import 'package:client/features/workout_planning/domain/entities/planned_workout_exercise.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_set.dart';
import 'package:client/features/workout_planning/presentation/state/planned_exercise_state.dart';
import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';
import 'package:client/features/workout_planning/presentation/state/planned_set_state.dart';

PlannedSetState toStateSet(PlannedWorkoutSet set) {
  return PlannedSetState(
    estWeight: set.estWeight,
    maxRep: set.maxRep,
    minRep: set.minRep,
  );
}

PlannedExerciseState toStateExercise(PlannedWorkoutExercise ex) {
  return PlannedExerciseState(
    equipment: ex.equipment ?? "",
    exerciseName: ex.exerciseName ?? "",
    imagePath: ex.exercisePath ?? "",
    notes: ex.notes ?? "",
    sets: ex.sets.map((s) => toStateSet(s)).toList(),
  );
}

PlannedSessionState toStateSession(PlannedWorkoutSession s) {
  return PlannedSessionState(
    name: s.name,
    exercises: s.exercises.map((ex) => toStateExercise(ex)).toList(),
  );
}

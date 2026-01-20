import 'package:client/data/models/performed_set.dart';
import 'package:client/features/workout_logging/presentation/state/performed_exercise_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_set_state.dart';
import 'package:client/features/workout_logging/presentation/state/workout_logging_state.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_exercise.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_set.dart';

WorkoutLoggingState toWorkoutLoggingState(PlannedWorkoutSession s) {
  return WorkoutLoggingState(
    name: s.name,
    performedSessionId: "",
    performedStats: [],
    performedExercise: s.exercises.map(mapPlannedExercise).toList(),
  );
}

PerformedExerciseState mapPlannedExercise(PlannedWorkoutExercise e) {
  return PerformedExerciseState(
    exerciseName: e.exerciseName,
    imagePath: e.imagePath,
    equipment: e.equipment ?? "",
    exId: e.exId,
    notes: e.notes ?? "",
    sets: e.sets.map(mapPlannedSet).toList(),
  );
}

PerformedSetState mapPlannedSet(PlannedWorkoutSet s) {
  String repRange;
  if (s.minRep == s.maxRep) {
    repRange = s.minRep.toString();
  } else {
    repRange = '${s.minRep}-${s.maxRep}';
  }
  return PerformedSetState(
    estRep: repRange,
    estWeight: s.estWeight,
    actRep: 0,
    actWeight: 0,
  );
}

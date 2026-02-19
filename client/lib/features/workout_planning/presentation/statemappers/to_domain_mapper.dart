import 'package:client/features/workout_planning/domain/entities/planned_workout_exercise.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_set.dart';
import 'package:client/features/workout_planning/presentation/state/planned_exercise_state.dart';
import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';
import 'package:client/features/workout_planning/presentation/state/planned_set_state.dart';

PlannedWorkoutSet mapSet(PlannedSetState s) {
  return PlannedWorkoutSet(
    minRep: s.minRep,
    maxRep: s.maxRep,
    estWeight: s.estWeight,
    setId: s.setId,
  );
}

// Map PlannedExerciseState → PlannedWorkoutExercise
PlannedWorkoutExercise mapExercise(PlannedExerciseState e) {
  return PlannedWorkoutExercise(
    exId: e.exerciseName, // or generate an ID if you want
    imagePath: e.imagePath,
    exerciseName: e.exerciseName,
    equipment: e.equipment,
    notes: e.notes,
    sets: e.sets.map(mapSet).toList(),
  );
}

// Map PlannedSessionState → PlannedWorkoutSession
PlannedWorkoutSession mapSession(PlannedSessionState s) {
  return PlannedWorkoutSession(
    sessionId: s.sessionId,
    name: s.name,
    createdAt: DateTime.now(),
    exercises: s.exercises.map(mapExercise).toList(),
  );
}

import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_exercise.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_set.dart';

PlannedSetIsar toIsarSet(PlannedWorkoutSet s) {
  return PlannedSetIsar()
    ..estWeight = s.estWeight
    ..minRep = s.minRep
    ..maxRep = s.maxRep;
}

PlannedExerciseIsar toIsarExercise(PlannedWorkoutExercise e) {
  return PlannedExerciseIsar(
    exId: e.exId,
    exerciseName: e.exerciseName,
    imagePath: e.imagePath,
    equipment: e.equipment,
    notes: e.notes,
  );
}

PlannedSessionIsar toIsarSession(PlannedWorkoutSession s) {
  return PlannedSessionIsar()
    ..sessionId = s.sessionId
    ..name = s.name
    ..createdAt = s.createdAt;
}

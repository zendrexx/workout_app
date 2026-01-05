import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_exercise.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_set.dart';

PlannedSetIsar toIsarSet(PlannedWorkoutSet s) {
  final sets = PlannedSetIsar()
    ..estWeight = s.estWeight
    ..minRep = s.minRep
    ..maxRep = s.maxRep;
  return sets;
}

PlannedExerciseIsar toIsarExercise(PlannedWorkoutExercise e) {
  final ex = PlannedExerciseIsar()
    ..exId = e.exId
    ..exerciseName = e.exerciseName
    ..exercisePath = e.exercisePath
    ..equipment = e.equipment
    ..notes = e.notes;
  ex.sets.addAll(e.sets.map(toIsarSet));
  return ex;
}

PlannedSessionIsar toIsarSession(PlannedWorkoutSession s) {
  final session = PlannedSessionIsar()
    ..name = s.name
    ..createdAt = s.createdAt;
  session.plannedExercise.addAll(s.exercises.map(toIsarExercise));
  return session;
}

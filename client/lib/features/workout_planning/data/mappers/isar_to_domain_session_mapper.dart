import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_exercise.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_set.dart';

PlannedWorkoutSet toDomainSet(PlannedSetIsar s) {
  final sets = PlannedWorkoutSet(
    estWeight: s.estWeight ?? 0,
    maxRep: s.maxRep ?? 0,
    minRep: s.minRep ?? 0,
  );

  return sets;
}

PlannedWorkoutExercise toDomainPlannedExercise(PlannedExerciseIsar e) {
  final ex = PlannedWorkoutExercise(
    exId: e.exId,
    exerciseName: e.exerciseName,
    exercisePath: e.exercisePath,
    equipment: e.equipment,
    notes: e.notes,
    sets: e.sets.map((s) => toDomainSet(s)).toList(),
  );

  return ex;
}

PlannedWorkoutSession toDomainSession(PlannedSessionIsar s) {
  final session = PlannedWorkoutSession(
    createdAt: s.createdAt,
    name: s.name ?? "",
    sessionId: s.sessionId,
    exercises: s.plannedExercise
        .map((e) => toDomainPlannedExercise(e))
        .toList(),
  );

  return session;
}

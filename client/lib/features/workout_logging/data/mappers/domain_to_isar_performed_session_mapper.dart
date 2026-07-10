import 'package:client/features/workout_logging/data/models/performed_exercise_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_session_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_sets_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_stats_isar.dart';
import 'package:client/features/workout_logging/domain/entities/performed_exercise.dart';
import 'package:client/features/workout_logging/domain/entities/performed_session.dart';
import 'package:client/features/workout_logging/domain/entities/performed_set.dart';
import 'package:client/features/workout_logging/domain/entities/performed_stats.dart';

PerformedSetsIsar toPerformedSet(PerformedSet ps) {
  return PerformedSetsIsar()
    ..actWeight = ps.actWeight
    ..actualRep = ps.actRep
    ..estRep = ps.estRep
    ..estWeight = ps.estWeight
    ..isCompleted = ps.isCompleted;
}

PerformedExerciseIsar toPerformedExercise(PerformedExercise pe) {
  return PerformedExerciseIsar()
    ..exerciseName = pe.exerciseName
    ..imagePath = pe.imagePath
    ..exId = pe.exId
    ..equipment = pe.equipment
    ..notes = pe.notes
    ..performedSets = pe.sets.map((s) => toPerformedSet(s)).toList();
}

PerformedStatsIsar toWorkoutStatsIsar(PerformedStats psts) {
  return PerformedStatsIsar()
    ..totalVolume = psts.totalVolume
    ..totalSets = psts.totalSets
    ..totalSeconds = psts.totalSeconds;
}

PerformedSessionIsar toPerformedSessionIsar(PerformedSession psi) {
  return PerformedSessionIsar(
    endTime: psi.endTime,
    name: psi.name,
    plannedSessionId: psi.plannedSessionId,
    performedSessionId: psi.performedSessionId,
    performedExercises: psi.performedExercise
        .map((pe) => toPerformedExercise(pe))
        .toList(),
    performedStats: toWorkoutStatsIsar(psi.performedStats),
  );
}


  // // just map exercises and sets without linking
  // session.performedExercises.addAll(
  //   psi.performedExercise.map((pe) => toPerformedExercise(pe)),
  // );

  // session.workoutStats.value = toWorkoutStatsIsar(psi.performedStats);

  // return session;


import 'package:client/features/workout_logging/data/models/performed_exercise_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_session_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_sets_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_stats_isar.dart';
import 'package:client/features/workout_logging/domain/entities/performed_exercise.dart';
import 'package:client/features/workout_logging/domain/entities/performed_session.dart';
import 'package:client/features/workout_logging/domain/entities/performed_set.dart';
import 'package:client/features/workout_logging/domain/entities/performed_stats.dart';
import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';

PerformedSet toDomainPerformedSet(PerformedSetsIsar s) {
  print("ARE SETS COMPLETE");
  print(s.isCompleted);
  final sets = PerformedSet(
    actRep: s.actualRep ?? 0,
    actWeight: s.actWeight ?? 0,
    estWeight: s.estWeight ?? 0,
    estRep: s.estRep ?? "",
    isCompleted: s.isCompleted,
  );

  return sets;
}

PerformedExercise toDomainPlannedExercise(PerformedExerciseIsar e) {
  final ex = PerformedExercise(
    exId: e.exId,
    exerciseName: e.exerciseName,
    imagePath: e.imagePath,
    equipment: e.equipment ?? "",
    notes: e.notes ?? "",
    sets: e.sets.map((s) => toDomainPerformedSet(s)).toList(),
  );

  return ex;
}

PerformedStats toDomainPerformedStats(PerformedStatsIsar ps) {
  return PerformedStats(
    totalSeconds: ps.totalSeconds,
    totalVolume: ps.totalVolume,
    totalSets: ps.totalSets,
  );
}

PerformedSession toDomainPerformedSession(PerformedSessionIsar s) {
  return PerformedSession(
    name: s.name,
    performedSessionId: s.performedSessionId,
    performedExercise: s.performedExercises
        .map((e) => toDomainPlannedExercise(e))
        .toList(),
    performedStats: toDomainPerformedStats(s.performedStats.value!),
    endTime: s.endTime,
    isCompleted: s.isCompleted,
  );
}

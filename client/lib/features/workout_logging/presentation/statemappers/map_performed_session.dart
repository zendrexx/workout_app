import 'package:client/core/utils/id_generator.dart';
import 'package:client/features/workout_logging/data/models/performed_session_isar.dart';
import 'package:client/features/workout_logging/domain/entities/performed_exercise.dart';
import 'package:client/features/workout_logging/domain/entities/performed_session.dart';
import 'package:client/features/workout_logging/domain/entities/performed_set.dart';
import 'package:client/features/workout_logging/domain/entities/performed_stats.dart';
import 'package:client/features/workout_logging/presentation/state/performed_exercise_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_session_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_set_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_stats_state.dart';

PerformedSet mapPerformedSet(PerformedSetState s) {
  return PerformedSet(
    actRep: s.actRep,
    actWeight: s.actWeight,
    estRep: s.estRep,
    estWeight: s.estWeight,
    isCompleted: s.isCompleted,
  );
}

// Map PlannedExerciseState → PlannedWorkoutExercise
PerformedExercise mapPerformedExercise(PerformedExerciseState e) {
  return PerformedExercise(
    exId: e.exerciseName, // or generate an ID if you want
    imagePath: e.imagePath,
    exerciseName: e.exerciseName,
    equipment: e.equipment,
    notes: e.notes,
    sets: e.sets.map(mapPerformedSet).toList(),
  );
}

PerformedStats mapPerfomedStats(PerformedStatsState pstate) {
  return PerformedStats(
    totalSeconds: pstate.totalSeconds,
    totalVolume: pstate.totalVolume,
    totalSets: pstate.totalSets,
  );
}

// Map PlannedSessionState → PlannedWorkoutSession
PerformedSession mapPerformedSession(PerformedSessionState s) {
  return PerformedSession(
    performedSessionId: IdGenerator().getId(),
    name: s.name,
    performedStats: mapPerfomedStats(s.performedStats),
    performedExercise: s.performedExercise.map(mapPerformedExercise).toList(),
    endTime: DateTime.now(),
    isCompleted: true,
  );
}

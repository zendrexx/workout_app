import 'package:client/features/workout_logging/domain/entities/performed_exercise.dart';
import 'package:client/features/workout_logging/domain/entities/performed_session.dart';
import 'package:client/features/workout_logging/domain/entities/performed_set.dart';
import 'package:client/features/workout_logging/domain/entities/performed_stats.dart';
import 'package:client/features/workout_logging/presentation/state/performed_exercise_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_session_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_set_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_stats_state.dart';

PerformedSessionState toPerformedSessionState(PerformedSession s) {
  return PerformedSessionState(
    name: s.name,
    performedSessionId: "",
    performedStats: toPerformedStatsState(s.performedStats),
    performedExercise: s.performedExercise.map(toPerformedExercise).toList(),
    endTime: s.endTime,
  );
}

PerformedStatsState toPerformedStatsState(PerformedStats ps) {
  return PerformedStatsState(
    totalSeconds: ps.totalSeconds,
    totalVolume: ps.totalVolume,
    totalSets: ps.totalSets,
  );
}

PerformedExerciseState toPerformedExercise(PerformedExercise e) {
  return PerformedExerciseState(
    exerciseName: e.exerciseName,
    imagePath: e.imagePath,
    equipment: e.equipment,
    exId: e.exId,
    notes: e.notes,
    sets: e.sets.map(toPlannedSet).toList(),
  );
}

PerformedSetState toPlannedSet(PerformedSet s) {
  return PerformedSetState(
    estRep: s.estRep,
    estWeight: s.estWeight,
    actRep: 0,
    actWeight: 0,
    isCompleted: false,
  );
}

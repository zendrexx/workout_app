import 'package:client/core/utils/id_generator.dart';
import 'package:client/features/workout_logging/presentation/state/performed_exercise_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_session_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_set_state.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_exercise.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_set.dart';

PlannedWorkoutSet _mapPlannedSet(PerformedSetState s) {
  return PlannedWorkoutSet(minRep: s.actRep, maxRep: s.actRep, estWeight: s.actWeight);
}

PlannedWorkoutExercise _mapPlannedExercise(PerformedExerciseState e) {
  return PlannedWorkoutExercise(
    exId: e.exId,
    exerciseName: e.exerciseName,
    imagePath: e.imagePath,
    equipment: e.equipment,
    notes: e.notes,
    sets: e.sets.where((s) => s.isCompleted).map(_mapPlannedSet).toList(),
  );
}

/// Builds a reusable [PlannedWorkoutSession] template from an ad-hoc,
/// completed [PerformedSessionState] (a "Start Empty" workout), so it can be
/// logged again later. Exercises with no completed sets are dropped since a
/// template exercise must have at least one set.
PlannedWorkoutSession mapPerformedSessionToTemplate(PerformedSessionState s) {
  final exercises = s.performedExercise
      .map(_mapPlannedExercise)
      .where((e) => e.hasSet)
      .toList();

  return PlannedWorkoutSession(
    sessionId: IdGenerator().getId(),
    name: s.name,
    createdAt: DateTime.now(),
    exercises: exercises,
  );
}

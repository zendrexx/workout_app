import 'package:client/features/workout_planning/domain/failures/planned_session_failure.dart';

String mapPlannedSessionFailure(PlannedSessionFailure failure) {
  return switch (failure) {
    EmptySessionNameFailure() => 'Session name is required',
    EmptyExercisesFailure() => 'Add at least one exercise',
    EmptysSetsFailure() => 'Add at least one set per Exercise',
  };
}

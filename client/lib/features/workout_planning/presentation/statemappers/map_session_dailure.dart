import 'package:client/features/workout_planning/domain/failures/session_failure.dart';

String mapSessionFailure(SessionFailure failure) {
  return switch (failure) {
    EmptySessionNameFailure() => 'Session name is required',
    EmptyExercisesFailure() => 'Add at least one exercise',
    EmptysSetsFailure() => 'Add at least one set per Exercise',
  };
}

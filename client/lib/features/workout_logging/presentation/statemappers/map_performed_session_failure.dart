import 'package:client/features/workout_logging/domain/failures/performed_session_failure.dart';

String mapPerformedSessionFailure(PerformedSessionFailure failure) {
  return switch (failure) {
    EmptyExercisesFailure() => 'Add at least one exercise',
    EmptysSetsFailure() => 'Add at least one set per Exercise',
    NoCompletedSetFailure() => 'Finish at least one set',
  };
}

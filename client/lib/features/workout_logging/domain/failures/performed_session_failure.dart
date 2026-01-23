sealed class PerformedSessionFailure {
  const PerformedSessionFailure();
}

class EmptyExercisesFailure extends PerformedSessionFailure {}

class EmptysSetsFailure extends PerformedSessionFailure {}

class NoCompletedSetFailure extends PerformedSessionFailure {}

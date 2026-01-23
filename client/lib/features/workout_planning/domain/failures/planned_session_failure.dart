sealed class PlannedSessionFailure {
  const PlannedSessionFailure();
}

class EmptySessionNameFailure extends PlannedSessionFailure {}

class EmptyExercisesFailure extends PlannedSessionFailure {}

class EmptysSetsFailure extends PlannedSessionFailure {}

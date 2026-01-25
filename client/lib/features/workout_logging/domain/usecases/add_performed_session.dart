import 'package:client/features/workout_logging/domain/entities/performed_session.dart';
import 'package:client/features/workout_logging/domain/failures/performed_session_failure.dart';
import 'package:client/features/workout_logging/domain/repositories/performed_workout_repository.dart';
import 'package:dartz/dartz.dart';

class AddPerformedSession {
  PerformedWorkoutRepository repo;
  AddPerformedSession(this.repo);

  Future<Either<PerformedSessionFailure, void>> call(
    PerformedSession psession,
  ) async {
    if (!psession.hasExercise) {
      return Left(EmptyExercisesFailure());
    }
    for (final e in psession.performedExercise) {
      if (!e.hasSet) {
        return Left(EmptysSetsFailure());
      }
      if (!e.hasCompletedSet) {
        return Left(NoCompletedSetFailure());
      }
    }

    await repo.addPerformedSession(psession);
    return const Right(null);
  }
}

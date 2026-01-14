import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/domain/failures/session_failure.dart';
import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';
import 'package:dartz/dartz.dart';

class AddWorkoutSession {
  final PlannedWorkoutSessionRepository repo;

  AddWorkoutSession(this.repo);

  Future<Either<SessionFailure, void>> call(
    PlannedWorkoutSession session,
  ) async {
    if (!session.hasName) {
      return Left(EmptySessionNameFailure());
    }
    if (!session.hasExercise) {
      return Left(EmptyExercisesFailure());
    }
    for (final e in session.exercises) {
      if (!e.hasSet) {
        return Left(EmptysSetsFailure());
      }
    }

    await repo.addSession(session);
    return const Right(null);
  }
}

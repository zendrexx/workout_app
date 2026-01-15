import 'package:client/features/workout_planning/domain/entities/exercise.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';

class GetAllPlannedSession {
  final PlannedWorkoutSessionRepository repo;

  GetAllPlannedSession(this.repo);

  Future<List<PlannedWorkoutSession>> call() {
    return repo.getAllPlannedSession();
  }
}

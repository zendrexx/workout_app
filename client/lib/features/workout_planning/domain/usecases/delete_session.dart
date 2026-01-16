import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';

class DeleteSession {
  final PlannedWorkoutSessionRepository repo;

  DeleteSession(this.repo);

  Future<void> call(String sessionId) {
    return repo.deleteSession(sessionId);
  }
}

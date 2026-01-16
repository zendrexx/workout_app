import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';

class DuplicateSession {
  final PlannedWorkoutSessionRepository repo;

  DuplicateSession(this.repo);

  Future<void> call(String sessionId) {
    return repo.duplicateSession(sessionId);
  }
}

import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';

class DeleteSession {
  final PlannedWorkoutSessionRepository repo;

  DeleteSession(this.repo);

  Future<void> call(int id) {
    return repo.deleteSession(id);
  }
}

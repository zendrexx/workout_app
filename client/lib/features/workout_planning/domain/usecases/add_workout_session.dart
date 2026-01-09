import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';

class AddWorkoutSession {
  final PlannedWorkoutSessionRepository repo;

  AddWorkoutSession(this.repo);

  Future<void> call(PlannedWorkoutSession session) {
    if (!session.isValid) {
      throw Exception('Invalid Workout Session');
    }
    return repo.addSession(session);
  }
}

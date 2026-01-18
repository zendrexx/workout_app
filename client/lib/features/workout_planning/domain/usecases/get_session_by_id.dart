import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';

class GetSessionById {
  final PlannedWorkoutSessionRepository repo;

  GetSessionById(this.repo);

  Future<PlannedWorkoutSession> call(String sessionId) async {
    final session = await repo.getSessionById(sessionId);

    if (session == null) {
      throw Exception('Workout Session not found');
    }

    return session;
  }
}

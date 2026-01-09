import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';

class GetSessionById {
  final PlannedWorkoutSessionRepository repo;

  GetSessionById(this.repo);

  Future<PlannedSessionIsar> call(int id) async {
    final session = await repo.getSessionById(id);

    if (session == null) {
      throw Exception('Workout Session not found');
    }

    return session;
  }
}

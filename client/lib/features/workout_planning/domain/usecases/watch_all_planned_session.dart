import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';

class WatchAllPlannedSession {
  final PlannedWorkoutSessionRepository repo;

  WatchAllPlannedSession(this.repo);

  Stream<List<PlannedWorkoutSession>> call() {
    return repo.watchAllSessions();
  }
}

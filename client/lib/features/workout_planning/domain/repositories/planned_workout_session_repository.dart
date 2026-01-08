import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';

abstract class PlannedWorkoutSessionRepository {
  Future<List<PlannedSessionIsar>> getAllPlannedSession();
  Future<PlannedSessionIsar?> getSessionById(int id);
  Future<void> addSession(PlannedWorkoutSession plannedSession);
  // Future<void> deleteSession(int id);
  // Future<PlannedSessionIsar?> duplicateSession(int id);
}

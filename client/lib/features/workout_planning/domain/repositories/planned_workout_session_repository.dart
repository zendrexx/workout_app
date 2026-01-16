import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_planning/domain/entities/exercise.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';

abstract class PlannedWorkoutSessionRepository {
  Stream<List<PlannedWorkoutSession>> watchAllSessions();
  //Future<List<PlannedWorkoutSession>> getAllPlannedSession();
  Future<PlannedWorkoutSession?> getSessionById(int id);
  Future<void> addSession(PlannedWorkoutSession plannedSession);
  Future<List<Exercise>> getAllExercises();
  Future<void> deleteSession(String sessionId);
  Future<PlannedSessionIsar?> duplicateSession(String sessionId);
}

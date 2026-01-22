import 'package:client/features/workout_logging/domain/entities/workout_logging.dart';

abstract class PerformedWorkoutRepository {
  Stream<List<WorkoutLogging>> watchAllPerformedSession();
  Future<WorkoutLogging?> getPerformedSessionById(String sessionId);
  Future<void> addPerformedSession(WorkoutLogging plannedSession);
}

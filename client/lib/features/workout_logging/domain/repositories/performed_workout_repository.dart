import 'package:client/features/workout_logging/domain/entities/performed_session.dart';

abstract class PerformedWorkoutRepository {
  Stream<List<PerformedSession>> watchAllPerformedSession();
  Future<PerformedSession?> getPerformedSessionById(String sessionId);
  Future<void> addPerformedSession(PerformedSession performedSession);
}

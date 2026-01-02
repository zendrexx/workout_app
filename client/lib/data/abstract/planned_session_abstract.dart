import 'package:client/data/models/planned_session.dart';

abstract class PlannedSessionAbstract {
  Future<List<PlannedSession>> getAllPlannedSession();
  Future<PlannedSession?> getSessionById(int id);
  Future<void> addSession(PlannedSession plannedSession);
  Future<void> deleteSession(int id);
  Future<PlannedSession?> duplicateSession(int id);
}

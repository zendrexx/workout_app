import 'package:client/data/models/planned_session.dart';

abstract class PlannedSessionAbstract {
  Future<List<PlannedSession>> getAllPlannedSession();
  Future<void> addSession(PlannedSession plannedSession);
  //just to push jan 1
}

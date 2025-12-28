import 'package:client/data/models/planned_session.dart';

abstract class PlannedSessionAbstract {
  Future<List<PlannedSession>> getAllPlannedSession();
}

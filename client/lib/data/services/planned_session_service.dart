import 'package:client/data/models/planned_session.dart';
import 'package:client/data/services/database_service.dart';
import 'package:isar/isar.dart';

class PlannedSessionService {
  Future<List<PlannedSession>> getAllPlannedSession() async {
    final isar = DatabaseService.db;
    return await isar.plannedSessions.where().findAll();
  }

  Future<void> addSession(PlannedSession plannedSession) async {
    final isar = DatabaseService.db;
    await isar.writeTxn(
      () async => await isar.plannedSessions.put(plannedSession),
    );
  }

  Future<void> deleteSession(int id) async {
    final isar = DatabaseService.db;
    await isar.writeTxn(() async => await isar.plannedSessions.delete(id));
  }
}

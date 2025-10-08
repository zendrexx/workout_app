import 'package:client/data/models/session.dart';
import 'package:isar/isar.dart';

class PlannedSessionRepository {
  final Future<Isar> db;

  PlannedSessionRepository(this.db);

  Future<void> addSession(Session plannedSession) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.sessions.put(plannedSession);
      await plannedSession.exercises.save();
    });
  }

  Stream<List<Session>> watchSession() async* {
    final isar = await db;
    yield* isar.sessions.where().watch(fireImmediately: true);
  }

  Future<void> deleteSession(Id id) async {
    final isar = await db;
    await isar.writeTxn(() => isar.sessions.delete(id));
  }
}

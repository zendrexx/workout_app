import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/planned_session.dart';
import 'package:client/data/services/database_service.dart';
import 'package:isar/isar.dart';

class PlannedSessionService {
  Future<List<PlannedSession>> getAllPlannedSession() async {
    final isar = DatabaseService.db;

    // Fetch all sessions
    final sessions = await isar.plannedSessions.where().findAll();
    print("🟦 Found ${sessions.length} sessions");
    // Load all links (PlannedExercise and Exercise)
    for (final session in sessions) {
      await session.plannedExercise.load();
      print("  🟨plannedExercise count: ${session.plannedExercise.length}");
      // Then for each plannedExercise, load its exercise link
    }

    return sessions;
  }

  Future<PlannedSession?> getSessionById(int id) async {
    final isar = DatabaseService.db;

    final session = await isar.plannedSessions.get(id);
    if (session == null) {
      print("❌ Session with id $id not found");
      return null;
    }

    // Load linked exercises
    await session.plannedExercise.load();

    print(
      "✅ Loaded session '${session.name}' with ${session.plannedExercise.length} planned exercises",
    );
    return session;
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

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
      for (final plannedExercise in session.plannedExercise) {
        await plannedExercise.exercise.load();
      }
    }

    return sessions;
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

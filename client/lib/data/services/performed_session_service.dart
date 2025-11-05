import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/performed_session.dart';
import 'package:client/data/models/planned_exercise.dart';
import 'package:client/data/models/planned_session.dart';
import 'package:client/data/services/database_service.dart';
import 'package:isar/isar.dart';

class PerformedSessionService {
  Future<List<PerformedSession>> getAllPlannedSession() async {
    final isar = DatabaseService.db;

    // Fetch all sessions
    final sessions = await isar.performedSessions.where().findAll();
    print("🟦 Found ${sessions.length} sessions");
    // Load all links (PlannedExercise and Exercise)
    for (final session in sessions) {
      await session.performedExercises.load();
      print("  🟨plannedExercise count: ${session.performedExercises.length}");
      // Then for each plannedExercise, load its exercise link
    }

    return sessions;
  }

  Future<PerformedSession?> getSessionById(int id) async {
    final isar = DatabaseService.db;

    final session = await isar.performedSessions.get(id);
    if (session == null) {
      print("❌ Session with id $id not found");
      return null;
    }

    // Load linked exercises
    await session.performedExercises.load();

    print(
      "✅ Loaded session '${session.name}' with ${session.performedExercises.length} planned exercises",
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

  Future<PlannedSession?> duplicateSession(int id) async {
    final isar = DatabaseService.db;

    final original = await isar.plannedSessions.get(id);
    if (original == null) {
      print("❌ Session with id $id not found for duplication");
      return null;
    }

    // Load linked planned exercises
    await original.plannedExercise.load();

    // Create new session
    final newSession = PlannedSession()
      ..name = "Copy of ${original.name}"
      ..createdAt = DateTime.now();

    await isar.writeTxn(() async {
      // Save the duplicated session
      final newSessionId = await isar.plannedSessions.put(newSession);

      // Duplicate planned exercises
      for (final pe in original.plannedExercise) {
        final newPE = PlannedExercise()
          ..sets = pe.sets
          ..exerciseName = pe.exerciseName
          ..notes = pe.notes
          ..equipment = pe.equipment
          ..exercisePath = pe.exercisePath
          ..sets = pe.sets;

        await isar.plannedExercises.put(newPE);

        newSession.plannedExercise.add(newPE);
      }

      // Update links
      await newSession.plannedExercise.save();
    });

    return newSession;
  }
}

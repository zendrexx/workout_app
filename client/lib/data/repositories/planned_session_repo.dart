import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/planned_exercise.dart';
import 'package:client/data/models/planned_session.dart';
import 'package:client/core/database/database_service.dart';
import 'package:isar/isar.dart';

class PlannedSessionRepo {
  final Isar isar;
  PlannedSessionRepo(this.isar);
  Future<List<PlannedSession>> getAllPlannedSession() async {
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
    await isar.writeTxn(
      () async => await isar.plannedSessions.put(plannedSession),
    );
  }

  Future<void> deleteSession(int id) async {
    await isar.writeTxn(() async => await isar.plannedSessions.delete(id));
  }

  Future<PlannedSession?> duplicateSession(int id) async {
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

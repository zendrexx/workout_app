import 'package:isar/isar.dart';
import '../models/session.dart';
import '../models/planned_exercise.dart';
import '../models/planned_set.dart';
import '../models/exercise.dart';

class SessionService {
  final Isar isar;
  SessionService(this.isar);

  /// Create a new session
  Future<int> createSession(String name) async {
    final session = Session(name: name);

    return await isar.writeTxn(() async {
      return await isar.sessions.put(session);
    });
  }

  /// Add a planned exercise (with sets) to an existing session
  Future<void> addPlannedExercise({
    required int sessionId,
    required Exercise baseExercise,
    String? notes,
    List<PlannedSet>? sets,
  }) async {
    final session = await isar.sessions.get(sessionId);
    if (session == null) throw Exception("Session not found");

    // Save the base exercise if new
    await isar.writeTxn(() async {
      await isar.exercises.put(baseExercise);
    });

    // Create the planned exercise and link it
    final plannedExercise = PlannedExercise(notes: notes);
    plannedExercise.exercise.value = baseExercise;
    plannedExercise.session.value = session;

    if (sets != null && sets.isNotEmpty) {
      plannedExercise.sets.addAll(sets);
    }

    await isar.writeTxn(() async {
      await isar.plannedSets.putAll(sets ?? []);
      await isar.plannedExercises.put(plannedExercise);

      // save relationships
      await plannedExercise.exercise.save();
      await plannedExercise.session.save();
      await plannedExercise.sets.save();

      // add to session
      session.exercises.add(plannedExercise);
      await session.exercises.save();
    });
  }

  /// Get all sessions with exercises
  Future<List<Session>> getAllSessions() async {
    final sessions = await isar.sessions.where().findAll();
    for (final s in sessions) {
      await s.exercises.load();
    }
    return sessions;
  }
}

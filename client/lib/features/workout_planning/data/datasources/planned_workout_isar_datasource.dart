import 'package:client/core/database/database_service.dart';
import 'package:client/features/workout_planning/data/mappers/isar_to_domain_session_mapper.dart';
import 'package:client/features/workout_planning/data/mappers/planned_exercise_copy.dart';
import 'package:client/features/workout_planning/data/models/exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';
import 'package:client/features/workout_planning/domain/entities/exercise.dart';
import 'package:isar/isar.dart';

class PlannedWorkoutIsarDatasource {
  final Isar isar;
  PlannedWorkoutIsarDatasource(this.isar);

  Future<void> addSession({
    required PlannedSessionIsar session,
    required List<PlannedExerciseIsar> exercises,
    required Map<PlannedExerciseIsar, List<PlannedSetIsar>> setsMap,
  }) async {
    final db = isar;

    await db.writeTxn(() async {
      await db.plannedSessionIsars.put(session);
      await db.plannedExerciseIsars.putAll(exercises);

      for (final sets in setsMap.values) {
        await db.plannedSetIsars.putAll(sets);
      }

      for (final entry in setsMap.entries) {
        entry.key.sets.addAll(entry.value);
        await entry.key.sets.save();
      }

      session.plannedExercise.addAll(exercises);
      await session.plannedExercise.save();
    });
  }

  Future<List<PlannedSessionIsar>> getAllPlannedSession() async {
    final db = isar;
    return db.plannedSessionIsars.where().findAll();
  }

  Future<void> deleteSession(int id) async {
    await isar.writeTxn(() async => await isar.plannedSessionIsars.delete(id));
  }

  Future<PlannedSessionIsar?> duplicateSession(int id) async {
    final original = await isar.plannedSessionIsars.get(id);
    if (original == null) {
      print("❌ Session with id $id not found for duplication");
      return null;
    }

    // Load linked planned exercises
    await original.plannedExercise.load();
    for (final pe in original.plannedExercise) {
      await pe.sets.load();
    }
    // Create new session
    late PlannedSessionIsar newSession;
    await isar.writeTxn(() async {
      newSession = PlannedSessionIsar()
        ..name = "Copy of ${original.name}"
        ..createdAt = DateTime.now();

      await isar.plannedSessionIsars.put(newSession);

      for (final pe in original.plannedExercise) {
        final newPE = pe.deepCopy();

        await isar.plannedExerciseIsars.put(newPE);
        newSession.plannedExercise.add(newPE);
      }

      await newSession.plannedExercise.save();
    });

    return newSession;
  }

  Future<PlannedSessionIsar?> getSessionById(int id) async {
    final db = isar;

    final session = await db.plannedSessionIsars.get(id);
    if (session == null) return null;

    // IMPORTANT: Load links
    await session.plannedExercise.load();

    for (final exercise in session.plannedExercise) {
      await exercise.sets.load();
    }

    return session;
  }

  Future<List<ExerciseIsar>> getAllExercies() async {
    final db = isar;
    final exercises = db.exerciseIsars.where().findAll();
    return exercises;
  }
}

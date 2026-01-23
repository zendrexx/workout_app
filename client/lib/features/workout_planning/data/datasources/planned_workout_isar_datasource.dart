import 'package:client/core/database/database_service.dart';
import 'package:client/core/utils/id_generator.dart';
import 'package:client/features/workout_planning/data/mappers/isar_to_domain_session_mapper.dart';
import 'package:client/features/workout_planning/data/mappers/planned_exercise_copy.dart';
import 'package:client/features/workout_planning/data/mappers/planned_set_copy.dart';
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
      // 1️⃣ Try to get the session by sessionId
      PlannedSessionIsar? sessionInDb = await db.plannedSessionIsars
          .getBySessionId(session.sessionId);

      // 2️⃣ If not found, create new
      sessionInDb ??= PlannedSessionIsar(
        sessionId: session.sessionId,
        createdAt: session.createdAt,
        name: session.name,
      );

      // 3️⃣ Update fields
      sessionInDb
        ..name = session.name
        ..createdAt = session.createdAt;

      // 4️⃣ MUST put before touching links
      await db.plannedSessionIsars.put(sessionInDb);

      // 5️⃣ Cleanup old exercises & sets if editing
      await sessionInDb.plannedExercise.load();
      for (final oldEx in sessionInDb.plannedExercise) {
        await oldEx.sets.load();
        await db.plannedSetIsars.deleteAll(
          oldEx.sets.map((s) => s.id).toList(),
        );
      }
      await db.plannedExerciseIsars.deleteAll(
        sessionInDb.plannedExercise.map((e) => e.id).toList(),
      );
      sessionInDb.plannedExercise.clear();

      // 6️⃣ Save new exercises & sets
      await db.plannedExerciseIsars.putAll(exercises);
      for (final sets in setsMap.values) {
        await db.plannedSetIsars.putAll(sets);
      }
      for (final entry in setsMap.entries) {
        entry.key.sets.addAll(entry.value);
        await entry.key.sets.save();
      }

      // 7️⃣ Link exercises to session
      sessionInDb.plannedExercise.addAll(exercises);
      await sessionInDb.plannedExercise.save();
    });
  }

  Stream<List<PlannedSessionIsar>> watchAll() {
    return isar.plannedSessionIsars.where().watch(fireImmediately: true);
  }

  Future<void> deleteSession(String sessionId) async {
    await isar.writeTxn(() async {
      final session = await isar.plannedSessionIsars.getBySessionId(sessionId);
      if (session != null) {
        await isar.plannedSessionIsars.delete(session.id);
      }
      // await isar.plannedSessionIsars.clear();
    });
  }

  Future<PlannedSessionIsar?> duplicateSession(String sessionId) async {
    final original = await isar.plannedSessionIsars.getBySessionId(sessionId);
    if (original == null) return null;

    await original.plannedExercise.load();

    late PlannedSessionIsar newSession;

    await isar.writeTxn(() async {
      newSession = PlannedSessionIsar(
        name: "Copy of ${original.name}",
        createdAt: DateTime.now(),
        sessionId: IdGenerator().getId().toString(),
      );

      await isar.plannedSessionIsars.put(newSession);

      for (final oldPE in original.plannedExercise) {
        await oldPE.sets.load();

        // Make a copy without Isar ID
        final newPE = PlannedExerciseIsar(
          exId: IdGenerator().getId(),
          exerciseName: oldPE.exerciseName,
          notes: oldPE.notes,
          equipment: oldPE.equipment,
          imagePath: oldPE.imagePath,
        );

        await isar.plannedExerciseIsars.put(newPE);

        // Copy sets
        for (final oldSet in oldPE.sets) {
          final newSet = oldSet.deepCopy();
          await isar.plannedSetIsars.put(newSet);
          newPE.sets.add(newSet);
        }
        await newPE.sets.save();

        // Link exercise to new session
        newSession.plannedExercise.add(newPE);
      }

      await newSession.plannedExercise.save();
    });

    return newSession;
  }

  Future<PlannedSessionIsar?> getSessionById(String sessionId) async {
    final session = await isar.plannedSessionIsars.getBySessionId(sessionId);
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

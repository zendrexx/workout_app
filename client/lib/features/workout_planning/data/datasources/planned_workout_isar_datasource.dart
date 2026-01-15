import 'package:client/core/database/database_service.dart';
import 'package:client/features/workout_planning/data/mappers/isar_to_domain_session_mapper.dart';
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

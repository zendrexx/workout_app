import 'package:client/core/database/database_service.dart';
import 'package:client/features/workout_planning/data/mappers/isar_to_domain_session_mapper.dart';
import 'package:client/features/workout_planning/data/models/exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';
import 'package:client/features/workout_planning/domain/entities/exercise.dart';
import 'package:isar/isar.dart';

class PlannedWorkoutIsarDatasource {
  final DatabaseService dbService;
  PlannedWorkoutIsarDatasource(this.dbService);

  Future<void> addSession(PlannedSessionIsar session) async {
    final db = dbService.isar;

    await db.writeTxn(() async {
      //Save session first
      await db.plannedSessionIsars.put(session);

      //Save exercises
      for (final exercise in session.plannedExercise) {
        await db.plannedExerciseIsars.put(exercise);

        //Save sets FIRST
        for (final set in exercise.sets) {
          await db.plannedSetIsars.put(set);
        }

        //Then save the links
        await exercise.sets.save();
      }

      //Save exercise links on session
      await session.plannedExercise.save();
    });
  }

  Future<List<PlannedSessionIsar>> getAllPlannedSession() async {
    final db = dbService.isar;
    return db.plannedSessionIsars.where().findAll();
  }

  Future<PlannedSessionIsar?> getSessionById(int id) async {
    final db = dbService.isar;

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
    final db = dbService.isar;
    final exercises = db.exerciseIsars.where().findAll();
    return exercises;
  }
}

import 'package:client/core/database/database_service.dart';
import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:isar/isar.dart';

class WorkoutIsarDatasource {
  final DatabaseService dbService;
  WorkoutIsarDatasource(this.dbService);

  Future<void> saveSession(PlannedSessionIsar session) async {
    final db = dbService.isar;
    await db.writeTxn(() async {
      await db.plannedSessionIsars.put(session);
      for (final ex in session.plannedExercise) {
        await db.plannedExerciseIsars.put(ex);
        await ex.sets.save();
      }
      await session.plannedExercise.save();
    });
  }

  Future<List<PlannedSessionIsar>> getSessions() async {
    final db = dbService.isar;
    return db.plannedSessionIsars.where().findAll();
  }
}

import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/planned_exercise.dart';
import 'package:client/data/models/planned_set.dart';
import 'package:client/data/models/planned_session.dart';
import 'package:client/data/services/exercise_service.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  static late final Isar db;

  static Future<void> setup() async {
    final appDir = await getApplicationDocumentsDirectory();
    db = await Isar.open([
      PlannedSessionSchema,
      PlannedExerciseSchema,
      PlannedSetSchema,
      ExerciseSchema,
    ], directory: appDir.path);
  }

  static Future<void> resetExercises() async {
    await db.writeTxn(() async {
      await db.exercises.clear();
    });
    await seedExercises(db);
    print("✅ Exercises reset and reloaded from JSON");
  }
}

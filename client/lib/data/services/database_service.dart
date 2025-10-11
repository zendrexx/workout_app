import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/planned_exercise.dart';
import 'package:client/data/models/planned_set.dart';
import 'package:client/data/models/planned_session.dart';
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
}

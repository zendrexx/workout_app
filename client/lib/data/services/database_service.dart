import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/session.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  static late final Isar db;

  static Future<void> setup() async {
    final appDir = await getApplicationDocumentsDirectory();
    db = await Isar.open([
      SessionSchema,
      ExerciseSchema,
    ], directory: appDir.path);
  }
}

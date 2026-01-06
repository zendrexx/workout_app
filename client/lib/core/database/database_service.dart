import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';
import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/workout_stats.dart';
import 'package:client/data/models/performed_set.dart';
import 'package:client/data/models/performed_exercise.dart';
import 'package:client/data/models/performed_session.dart';
import 'package:client/data/services/exercise_service.dart';

class DatabaseService {
  late final Isar isar; // <- no static

  /// Call this once at app start
  Future<void> setup() async {
    if (Isar.instanceNames.isNotEmpty) {
      isar = Isar.getInstance()!;
      return;
    }

    final appDir = await getApplicationDocumentsDirectory();

    isar = await Isar.open([
      PlannedSessionIsarSchema,
      PlannedExerciseIsarSchema,
      PlannedSetIsarSchema,
      ExerciseSchema,
      WorkoutStatsSchema,
      PerformedSetSchema,
      PerformedExerciseSchema,
      PerformedSessionSchema,
    ], directory: appDir.path);

    print("✅ Isar database opened at: ${appDir.path}");
  }

  /// Reset exercises (example helper)
  Future<void> resetExercises() async {
    await isar.writeTxn(() async {
      await isar.exercises.clear();
    });
    await seedExercises(isar);
  }
}

import 'package:client/features/workout_logging/data/models/performed_exercise_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_session_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_sets_isar.dart';
import 'package:client/features/workout_logging/data/models/workout_stats_isar.dart';
import 'package:isar/isar.dart';

class PerformedWorkoutIsarDatasource {
  final Isar isar;
  PerformedWorkoutIsarDatasource(this.isar);

  Future<void> addPerformedWorkout(PerformedSessionIsar performed) async {
    final db = isar;

    await db.writeTxn(() async {
      // Save session first
      await db.performedSessionIsars.put(performed);

      // Save exercises
      final exercises = performed.performedExercises.toList();
      await db.performedExerciseIsars.putAll(exercises);

      final stats = performed.workoutStats.value!;
      await db.workoutStatsIsars.put(stats);

      // Save sets for each exercise
      for (final ex in exercises) {
        final sets = ex.sets.toList();
        await db.performedSetsIsars.putAll(sets);
        await ex.sets.save();
      }

      // Link exercises to session
      await performed.performedExercises.save();
    });
  }
}

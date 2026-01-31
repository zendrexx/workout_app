import 'package:client/features/workout_logging/data/mappers/domain_to_isar_performed_session_mapper.dart';
import 'package:client/features/workout_logging/data/models/performed_exercise_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_session_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_sets_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_stats_isar.dart';
import 'package:client/features/workout_logging/domain/entities/performed_session.dart';
import 'package:isar/isar.dart';

class PerformedWorkoutIsarDatasource {
  final Isar isar;
  PerformedWorkoutIsarDatasource(this.isar);

  Future<void> addPerformedSession(PerformedSession session) async {
    final sessionIsar = toPerformedSessionIsar(session);

    // 🔹 Stats
    final statsIsar = toWorkoutStatsIsar(session.performedStats);
    sessionIsar.performedStats.value = statsIsar;

    final List<PerformedSetsIsar> allSetIsars = [];
    final List<PerformedExerciseIsar> exerciseIsars = [];

    // 🔹 Exercises & sets
    for (final pe in session.performedExercise) {
      final exIsar = toPerformedExercise(pe);

      final setIsars = pe.sets.map(toPerformedSet).toList();
      allSetIsars.addAll(setIsars);

      exIsar.sets.addAll(setIsars);
      exerciseIsars.add(exIsar);
    }

    sessionIsar.performedExercises.addAll(exerciseIsars);

    await isar.writeTxn(() async {
      // 1️⃣ Put stats
      await isar.performedStatsIsars.put(statsIsar);

      // 2️⃣ Put sets (REAL list)
      await isar.performedSetsIsars.putAll(allSetIsars);

      // 3️⃣ Put exercises
      await isar.performedExerciseIsars.putAll(exerciseIsars);

      // 4️⃣ Save exercise → sets links
      for (final ex in exerciseIsars) {
        await ex.sets.save();
      }

      // 5️⃣ Put session
      await isar.performedSessionIsars.put(sessionIsar);

      // 6️⃣ Save session links
      await sessionIsar.performedStats.save();
      await sessionIsar.performedExercises.save();
      // await isar.performedSessionIsars.clear();
    });
  }

  Stream<List<PerformedSessionIsar>> watchAll() {
    return isar.performedSessionIsars.where().watch(fireImmediately: true);
  }
}

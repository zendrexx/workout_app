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

    // 🔹 Exercises & sets
    final exerciseIsars = session.performedExercise.map((pe) {
      final exIsar = toPerformedExercise(pe);

      final setIsars = pe.sets.map(toPerformedSet).toList();
      exIsar.sets.addAll(setIsars);

      return exIsar;
    }).toList();

    sessionIsar.performedExercises.addAll(exerciseIsars);

    await isar.writeTxn(() async {
      // 1️⃣ Put stats
      await isar.performedStatsIsars.put(statsIsar);

      // 2️⃣ Put sets
      final allSets = exerciseIsars.expand((e) => e.sets).toList();
      await isar.performedSetsIsars.putAll(allSets);

      // 3️⃣ Put exercises
      await isar.performedExerciseIsars.putAll(exerciseIsars);

      // 4️⃣ Put session
      await isar.performedSessionIsars.put(sessionIsar);

      // 5️⃣ Save links LAST
      await sessionIsar.performedStats.save();
      await sessionIsar.performedExercises.save();
    });
  }

  Stream<List<PerformedSessionIsar>> watchAll() {
    return isar.performedSessionIsars.where().watch(fireImmediately: true);
  }
}

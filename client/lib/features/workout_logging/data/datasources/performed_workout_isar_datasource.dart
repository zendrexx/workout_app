import 'package:client/features/workout_logging/data/mappers/domain_to_isar_performed_session_mapper.dart';
import 'package:client/features/workout_logging/data/models/performed_exercise_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_session_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_sets_isar.dart';
import 'package:client/features/workout_logging/data/models/workout_stats_isar.dart';
import 'package:client/features/workout_logging/domain/entities/performed_session.dart';
import 'package:isar/isar.dart';

class PerformedWorkoutIsarDatasource {
  final Isar isar;
  PerformedWorkoutIsarDatasource(this.isar);

  Future<void> addPerformedSession(PerformedSession session) async {
    // 1️⃣ Map domain session → Isar session
    final sessionIsar = toPerformedSessionIsar(session);

    // 2️⃣ Map exercises & sets
    final exerciseIsars = session.performedExercise.map((pe) {
      // Map exercise
      final exIsar = toPerformedExercise(pe);

      // Map sets
      final setIsars = pe.sets.map((s) {
        final setIsar = toPerformedSet(s);

        return setIsar;
      }).toList();

      // Link sets to exercise
      exIsar.sets.addAll(setIsars);

      sessionIsar.performedExercises.add(exIsar);

      return exIsar;
    }).toList();

    // 3️⃣ Save everything in one transaction
    await isar.writeTxn(() async {
      // Save sets first
      final allSets = exerciseIsars.expand((e) => e.sets).toList();
      await isar.performedSetsIsars.putAll(allSets);

      // Save exercises
      await isar.performedExerciseIsars.putAll(exerciseIsars);

      // Save session
      await isar.performedSessionIsars.put(sessionIsar);
    });
  }
}

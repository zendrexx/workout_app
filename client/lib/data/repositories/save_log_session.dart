import 'package:client/data/model_temp/temp_session.dart';
import 'package:client/data/model_temp/temp_workout_stats.dart';
import 'package:client/data/models/performed_exercise.dart';
import 'package:client/data/models/performed_session.dart';
import 'package:client/data/models/performed_set.dart';
import 'package:client/data/models/planned_exercise.dart';
import 'package:client/data/models/planned_session.dart';
import 'package:client/data/models/planned_set.dart';
import 'package:client/data/services/database_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> saveLogSession(
  TempSession tempSession,
  TempWorkoutStats tempStats,
  WidgetRef ref,
) async {
  final isar = DatabaseService.db;

  await isar.writeTxn(() async {
    PerformedSession performedSession = PerformedSession();

    performedSession.name = tempSession.name;
    performedSession.isCompleted = true;
    // STEP 3: Recreate all sets and exercises
    final allSets = <PerformedSet>[];
    for (final tempExercise in tempSession.plannedExercise) {
      for (final tempSet in tempExercise.sets) {
        final set = PerformedSet()
          ..performedWeight = tempSet.actWeight
          ..performedRep = tempSet.actRep;

        allSets.add(set);
      }
    }
    await isar.performedSets.putAll(allSets);

    final performedExercises = <PerformedExercise>[];
    int setIndex = 0;
    for (final tempExercise in tempSession.plannedExercise) {
      final numSets = tempExercise.sets.length;
      final exerciseSets = allSets.sublist(setIndex, setIndex + numSets);
      setIndex += numSets;

      final performedExercise = PerformedExercise()
        ..exId = tempExercise.exercise?.exId
        ..notes = tempExercise.notes
        ..exerciseName = tempExercise.exercise?.name
        ..exercisePath = tempExercise.exercise?.imagePath
        ..equipment = tempExercise.exercise?.equipment;

      await isar.performedExercises.put(performedExercise);
      performedExercise.sets.addAll(exerciseSets);
      await performedExercise.sets.save();

      performedExercises.add(performedExercise);
    }

    // final tempWorkoutStats = TempWorkoutStats()
    //   ..tempTotalVolume = tempStats.tempTotalVolume
    //   ..tempTotalSets = tempStats.tempTotalSets;

    // Save session and link exercises
    await isar.performedSessions.put(performedSession);
    performedSession.performedExercises.addAll(performedExercises);
    await performedSession.performedExercises.save();
  });
}

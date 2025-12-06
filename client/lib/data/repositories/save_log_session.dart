import 'package:client/data/model_temp/temp_session.dart';
import 'package:client/data/model_temp/temp_workout_stats.dart';
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
    PlannedSession plannedSession = PlannedSession();

    plannedSession.name = tempSession.name;
    plannedSession.isCompleted = true;
    // STEP 3: Recreate all sets and exercises
    final allSets = <PlannedSet>[];
    for (final tempExercise in tempSession.plannedExercise) {
      for (final tempSet in tempExercise.sets) {
        final set = PlannedSet()
          ..estWeight = tempSet.estWeight
          ..maxRep = tempSet.maxRep
          ..minRep = tempSet.minRep;
        allSets.add(set);
      }
    }
    await isar.plannedSets.putAll(allSets);

    final plannedExercises = <PlannedExercise>[];
    int setIndex = 0;
    for (final tempExercise in tempSession.plannedExercise) {
      final numSets = tempExercise.sets.length;
      final exerciseSets = allSets.sublist(setIndex, setIndex + numSets);
      setIndex += numSets;

      final plannedExercise = PlannedExercise()
        ..exId = tempExercise.exercise?.exId
        ..notes = tempExercise.notes
        ..exerciseName = tempExercise.exercise?.name
        ..exercisePath = tempExercise.exercise?.imagePath
        ..equipment = tempExercise.exercise?.equipment;

      await isar.plannedExercises.put(plannedExercise);
      plannedExercise.sets.addAll(exerciseSets);
      await plannedExercise.sets.save();

      plannedExercises.add(plannedExercise);
    }

    final tempWorkoutStats = TempWorkoutStats()
      ..tempTotalVolume = tempStats.tempTotalVolume
      ..tempTotalSets = tempStats.tempTotalSets;

    // Save session and link exercises
    await isar.plannedSessions.put(plannedSession);
    plannedSession.plannedExercise.addAll(plannedExercises);
    await plannedSession.plannedExercise.save();
  });
}

import 'package:client/core/notifier/planned_exercises_stream_provider.dart';
import 'package:client/core/notifier/planned_session_stream_provider.dart';
import 'package:client/core/notifier/temp_session_notifier.dart';
import 'package:client/data/model_temp/temp_planned_exercise.dart';
import 'package:client/data/model_temp/temp_planned_sets.dart';
import 'package:client/data/model_temp/temp_session.dart';
import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/planned_exercise.dart';
import 'package:client/data/models/planned_session.dart';
import 'package:client/data/models/planned_set.dart';
import 'package:client/data/services/database_service.dart';
import 'package:client/data/services/planned_session_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

Future<void> saveSession(TempSession tempSession, WidgetRef ref) async {
  final isar = DatabaseService.db;

  await isar.writeTxn(() async {
    // STEP 1: Create and store all PlannedSets first
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

    // STEP 2: Create PlannedExercises and link sets
    final plannedExercises = <PlannedExercise>[];
    int setIndex = 0;
    for (final tempExercise in tempSession.plannedExercise) {
      final numSets = tempExercise.sets.length;
      final exerciseSets = allSets.sublist(setIndex, setIndex + numSets);
      setIndex += numSets;

      final plannedExercise = PlannedExercise()
        ..notes = tempExercise.notes
        ..exerciseName = tempExercise.exercise!.name
        ..exercisePath = tempExercise.exercise!.imagePath
        ..equipment = tempExercise.exercise!.equipment;

      await isar.plannedExercises.put(plannedExercise);
      plannedExercise.sets.addAll(exerciseSets);
      await plannedExercise.sets.save();

      plannedExercises.add(plannedExercise);
    }

    // STEP 3: Create PlannedSession and link exercises
    final plannedSession = PlannedSession()..name = tempSession.name;

    await isar.plannedSessions.put(plannedSession);
    plannedSession.plannedExercise.addAll(plannedExercises);
    await plannedSession.plannedExercise.save();
  });
}

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
    PlannedSession? plannedSession;

    //Check if editing an existing session
    if (tempSession.id != null) {
      plannedSession = await isar.plannedSessions.get(tempSession.id!);

      if (plannedSession != null) {
        //Clean up old linked data before replacing
        await plannedSession.plannedExercise.load();

        for (final oldEx in plannedSession.plannedExercise) {
          await oldEx.sets.load();
          // delete all sets linked to old exercise
          await isar.plannedSets.deleteAll(
            oldEx.sets.map((e) => e.id).toList(),
          );
        }

        // delete all old exercises linked to the session
        await isar.plannedExercises.deleteAll(
          plannedSession.plannedExercise.map((e) => e.id).toList(),
        );

        plannedSession.plannedExercise.clear();
      }
    }

    // STEP 1: Create new if null
    plannedSession ??= PlannedSession();

    // STEP 2: Update session name
    plannedSession.name = tempSession.name;

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

    // Save session and link exercises
    await isar.plannedSessions.put(plannedSession);
    plannedSession.plannedExercise.addAll(plannedExercises);
    await plannedSession.plannedExercise.save();
  });
}

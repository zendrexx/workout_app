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
    final plannedSession = PlannedSession()..name = tempSession.name;
    await isar.plannedSessions.put(plannedSession);

    final plannedExercises = <PlannedExercise>[];

    for (final tempPlanned in tempSession.plannedExercise) {
      final exercise = tempPlanned.exercise;

      Exercise? linkedExercise;

      if (exercise != null) {
        // Always use the persisted one, or insert and get the new ID
        linkedExercise = await isar.exercises.get(exercise.id);

        if (linkedExercise == null) {
          final newId = await isar.exercises.put(exercise);
          linkedExercise = await isar.exercises.get(
            newId,
          ); // ✅ refetch persisted one
        }
      }

      final plannedEx = PlannedExercise()
        ..exercise.value = linkedExercise; // ✅ link persisted object

      for (final tempSet in tempPlanned.sets) {
        final set = PlannedSet()
          ..estWeight = tempSet.estWeight
          ..maxRep = tempSet.maxRep
          ..minRep = tempSet.minRep;
        plannedEx.sets.add(set);
      }

      await isar.plannedExercises.put(plannedEx);
      await plannedEx.exercise.save(); // ✅ ensure link persisted
      await plannedEx.sets.save();

      plannedExercises.add(plannedEx);
    }

    plannedSession.plannedExercise.addAll(plannedExercises);
    await plannedSession.plannedExercise.save();
  });
}

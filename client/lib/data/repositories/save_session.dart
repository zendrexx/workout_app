import 'package:client/core/notifier/planned_exercises_stream_provider.dart';
import 'package:client/core/notifier/temp_session_notifier.dart';
import 'package:client/data/model_temp/temp_planned_exercise.dart';
import 'package:client/data/model_temp/temp_planned_sets.dart';
import 'package:client/data/model_temp/temp_session.dart';
import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/planned_exercise.dart';
import 'package:client/data/models/planned_session.dart';
import 'package:client/data/models/planned_set.dart';
import 'package:client/data/services/database_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

Future<void> saveSession(TempSession tempSession, WidgetRef ref) async {
  final isar = DatabaseService.db;
  print(tempSession);
  print(
    "this is temp session planned" +
        tempSession.plannedExercise[0].exercise!.name,
  );

  final plannedSession = PlannedSession()..name = tempSession.name;
  final plannedExercise = PlannedExercise()
    ..exercise.value = tempSession.plannedExercise[0].exercise;
  print("this is exercise");
  print(plannedExercise.exercise.value!.name);

  final plannedExercises = tempSession.plannedExercise.map((tempPlanned) {
    final plannedExercise = PlannedExercise()
      ..exercise.value = tempPlanned.exercise;

    for (final tempSet in tempPlanned.sets) {
      final set = PlannedSet()
        ..estWeight = tempSet.estWeight
        ..maxRep = tempSet.maxRep
        ..minRep = tempSet.minRep;
      plannedExercise.sets.add(set);
    }

    return plannedExercise;
  }).toList();

  plannedSession.plannedExercise.addAll(plannedExercises);

  await isar.writeTxn(() async {
    for (final ex in plannedExercises) {
      await isar.plannedExercises.put(ex);
      await ex.exercise.save();
      await ex.sets.save();
    }
  });
}

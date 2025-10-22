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

  // Converting tempExercises to plannedExercises
  final plannedExercises = tempSession.plannedExercise.map((temp) {
    final plannedExercise = PlannedExercise()..notes = temp.notes;
    plannedExercise.exercise.value = temp.exercise;

    return plannedExercise;
  }).toList();
  final plannedSession = PlannedSession()
    ..name = tempSession.name
    ..plannedExercise.addAll(plannedExercises);
  await isar.writeTxn(() async {
    await isar.plannedExercises.putAll(plannedExercises);
    await isar.plannedSessions.put(plannedSession);

    await plannedSession.plannedExercise.save();
  });
}

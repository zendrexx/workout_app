import 'dart:convert';
import 'package:client/features/workout_planning/data/models/exercise_isar.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';

Future<void> seedExercises(Isar isar) async {
  final count = await isar.exerciseIsars.count();

  final jsonString = await rootBundle.loadString('assets/exercises.json');
  final data = jsonDecode(jsonString) as List;
  final exercises = data.map((e) => ExerciseIsar.fromJson(e)).toList();

  // Re-seed on first run or whenever the bundled exercise list changes size
  // (e.g. the database was expanded). Planned/program exercises copy their
  // fields rather than linking to this library, so clearing is safe.
  if (count != exercises.length) {
    await isar.writeTxn(() async {
      await isar.exerciseIsars.clear();
      await isar.exerciseIsars.putAll(exercises);
    });

    print("Seeded ${exercises.length} exercises into Isar");
  } else {
    print("Exercises already seeded ($count in DB)");
  }
}

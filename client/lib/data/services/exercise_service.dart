import 'dart:convert';
import 'package:client/features/workout_planning/data/models/exercise_isar.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';

Future<void> seedExercises(Isar isar) async {
  final count = await isar.exerciseIsars.count();

  if (count == 0) {
    final jsonString = await rootBundle.loadString('assets/exercises.json');
    final data = jsonDecode(jsonString) as List;

    final exercises = data.map((e) => ExerciseIsar.fromJson(e)).toList();

    await isar.writeTxn(() async {
      await isar.exerciseIsars.putAll(exercises);
    });

    print("Seeded ${exercises.length} exercises into Isar");
  } else {
    print("Exercises already seeded ($count in DB)");
  }
}

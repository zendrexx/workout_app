import 'dart:convert';
import 'package:client/data/models/exercise.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';

Future<void> seedExercises(Isar isar) async {
  final count = await isar.exercises.count();

  if (count == 0) {
    final jsonString = await rootBundle.loadString('assets/exercises.json');
    final data = jsonDecode(jsonString) as List;

    final exercises = data.map((e) => Exercise.fromJson(e)).toList();

    await isar.writeTxn(() async {
      await isar.exercises.putAll(exercises);
    });

    print("Seeded ${exercises.length} exercises into Isar");
  } else {
    print("Exercises already seeded ($count in DB)");
  }
}

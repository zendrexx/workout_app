// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/planned_exercise.dart';

class TempSession {
  late String? name;
  DateTime createdAt = DateTime.now();
  bool isCompleted = false;
  final List<PlannedExercise> plannedExercise;
  TempSession({
    this.name,
    required this.isCompleted,
    this.plannedExercise = const [],
  });

  TempSession copyWith({
    String? name,
    bool? isCompleted,
    List<PlannedExercise>? plannedExercise,
  }) {
    return TempSession(
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
      plannedExercise: plannedExercise ?? this.plannedExercise,
    );
  }
}

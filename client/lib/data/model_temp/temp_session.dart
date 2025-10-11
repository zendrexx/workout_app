// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:client/data/models/exercise.dart';

class TempSession {
  late String? name;
  DateTime createdAt = DateTime.now();
  bool isCompleted = false;
  final List<Exercise> exercises;
  TempSession({
    this.name,
    required this.isCompleted,
    this.exercises = const [],
  });

  TempSession copyWith({
    String? name,
    bool? isCompleted,
    List<Exercise>? exercises,
  }) {
    return TempSession(
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
      exercises: exercises ?? this.exercises,
    );
  }
}

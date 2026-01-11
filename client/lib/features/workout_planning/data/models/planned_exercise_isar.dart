// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';

part 'planned_exercise_isar.g.dart';

@collection
class PlannedExerciseIsar {
  Id id = Isar.autoIncrement;

  String exerciseName;
  String? exercisePath;
  String? equipment;
  String exId;
  String? notes;

  var sets = IsarLinks<PlannedSetIsar>();

  var session = IsarLink<PlannedSessionIsar>();

  PlannedExerciseIsar({
    this.notes,
    required this.exId,
    required this.exerciseName,
    this.equipment,
    this.exercisePath,
  });
}

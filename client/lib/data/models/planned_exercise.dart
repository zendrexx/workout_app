// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/planned_session.dart';
import 'package:client/data/models/planned_set.dart';

part 'planned_exercise.g.dart';

@collection
class PlannedExercise {
  Id id = Isar.autoIncrement;

  String? exerciseName;
  String? exercisePath;
  String? equipment;

  String? notes;

  var sets = IsarLinks<PlannedSet>();

  var session = IsarLink<PlannedSession>();

  PlannedExercise({this.notes});
}

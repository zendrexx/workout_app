// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:isar/isar.dart';

import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';

part 'planned_exercise_isar.g.dart';

@embedded
class PlannedExerciseIsar {
  String exId = "";

  String exerciseName = "";
  String imagePath = "";
  String? equipment;

  String? notes;

  List<PlannedSetIsar> sets = [];

  PlannedExerciseIsar({
    this.notes,
    this.exId = "",
    this.exerciseName = "",
    this.equipment,
    this.imagePath = "",
  });
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

import 'package:client/features/workout_logging/data/models/performed_sets_isar.dart';

part 'performed_exercise_isar.g.dart';

@embedded
class PerformedExerciseIsar {
  String exId = "";

  String exerciseName = "";
  String imagePath = "";

  String? equipment;
  String? notes;
  List<PerformedSetsIsar> performedSets = [];
  PerformedExerciseIsar({
    this.notes,
    this.exId = "",
    this.exerciseName = "",
    this.equipment,
    this.imagePath = "",
  });
}

import 'package:client/data/model_temp/temp_planned_exercise.dart';
import 'package:client/data/models/planned_exercise.dart';
import 'package:client/data/model_temp/temp_planned_sets.dart';
import 'package:client/data/repositories/sets_converter.dart';

extension TempPlannedExerciseMapper on TempPlannedExercise {
  PlannedExercise toPlannedExercise() {
    return PlannedExercise(
      sets: sets.map((tempSet) => tempSet.toPlannedSet()).toList(),
    );
  }
}

import 'package:client/data/model_temp/temp_planned_sets.dart';
import 'package:client/data/models/exercise.dart';

class TempPlannedExercise {
  final Exercise? exercise;

  final String? notes;

  final List<TempPlannedSets> sets;

  TempPlannedExercise({
    this.exercise,
    this.notes,
    this.sets = const [], // Default to empty list
  });
}

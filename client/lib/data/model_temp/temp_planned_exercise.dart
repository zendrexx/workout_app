// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  TempPlannedExercise copyWith({
    Exercise? exercise,
    String? notes,
    List<TempPlannedSets>? sets,
  }) {
    return TempPlannedExercise(
      exercise: exercise ?? this.exercise,
      notes: notes ?? this.notes,
      sets: sets ?? this.sets,
    );
  }
}

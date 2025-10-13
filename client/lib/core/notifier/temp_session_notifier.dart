import 'package:client/data/model_temp/temp_session.dart';
import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/planned_exercise.dart';
import 'package:client/data/models/planned_session.dart';
import 'package:client/data/models/planned_set.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final tempSessionProvider =
    StateNotifierProvider<TempSessionNotifier, TempSession>(
      (ref) => TempSessionNotifier(),
    );

class TempSessionNotifier extends StateNotifier<TempSession> {
  TempSessionNotifier() : super(TempSession(name: "", isCompleted: false));
  void updateName(String newName) {
    state = state.copyWith(name: newName);
  }

  void addExercise(PlannedExercise exercise) {
    final updatedExercises = [...state.plannedExercise, exercise];
    state = state.copyWith(plannedExercise: updatedExercises);
  }

  void deleteExercise(int index) {
    final updatedExercises = [...state.plannedExercise];
    updatedExercises.removeAt(index);
    state = state.copyWith(plannedExercise: updatedExercises);
  }

  void updateExerciseAt(int index, PlannedExercise updatedExercise) {
    final updatedExercises = [...state.plannedExercise];
    if (index >= 0 && index < updatedExercises.length) {
      updatedExercises[index] = updatedExercise;
      state = state.copyWith(plannedExercise: updatedExercises);
    }
  }

  void addSetToExercise(int index, PlannedSet sets) {
    final addsets = [...state.plannedExercise[index].sets, sets];
     state = state.copyWith(plannedExercise[index].sets: addsets);
  }
}

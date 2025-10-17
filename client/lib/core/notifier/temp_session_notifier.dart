import 'package:client/data/model_temp/temp_planned_exercise.dart';
import 'package:client/data/model_temp/temp_planned_sets.dart';
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

  void addTitle(String title) {
    state = state.copyWith(name: title);
  }

  void addExercise(TempPlannedExercise exercise) {
    final updatedExercises = [...state.plannedExercise, exercise];
    state = state.copyWith(plannedExercise: updatedExercises);
  }

  void deleteExercise(int index) {
    final updatedExercises = [...state.plannedExercise];
    updatedExercises.removeAt(index);
    state = state.copyWith(plannedExercise: updatedExercises);
  }

  void updateExerciseAt(int index, TempPlannedExercise updatedExercise) {
    final updatedExercises = [...state.plannedExercise];
    if (index >= 0 && index < updatedExercises.length) {
      updatedExercises[index] = updatedExercise;
      state = state.copyWith(plannedExercise: updatedExercises);
    }
  }

  void addSetToExercise(int index, TempPlannedSets set) {
    // 1. Copy current exercise
    final exercise = state.plannedExercise[index];

    // 2. Create a new list of sets (immutably add new one)
    final updatedSets = [...exercise.sets, set];

    // 3. Create a new exercise with updated sets
    final updatedExercise = exercise.copyWith(sets: updatedSets);

    // 4. Replace that exercise in the plannedExercise list
    final updatedExercises = [...state.plannedExercise];
    updatedExercises[index] = updatedExercise;

    // 5. Update the state immutably
    state = state.copyWith(plannedExercise: updatedExercises);
  }

  void reset() {
    state = TempSession(name: null, isCompleted: false, plannedExercise: []);
  }
}

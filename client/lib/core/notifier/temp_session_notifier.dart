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

  void addNotesToExercise(int index, String note) {
    final updatedExercises = [...state.plannedExercise];
    final target = updatedExercises[index].copyWith(notes: note);

    updatedExercises[index] = target;

    state = state.copyWith(plannedExercise: updatedExercises);
  }

  void addWeightToSets(int exerciseIndex, int setIndex, double weight) {
    // Get a copy of all exercises
    final updatedExercises = [...state.plannedExercise];

    // Get the current exercise
    final currentExercise = updatedExercises[exerciseIndex];

    // Copy the sets of that exercise
    final updatedSets = [...currentExercise.sets];

    // Update the specific set with the new weight
    final updatedSet = updatedSets[setIndex].copyWith(estWeight: weight);
    updatedSets[setIndex] = updatedSet;

    // Update the exercise with the modified sets
    final updatedExercise = currentExercise.copyWith(sets: updatedSets);
    updatedExercises[exerciseIndex] = updatedExercise;

    // Update the state with the modified exercises
    state = state.copyWith(plannedExercise: updatedExercises);
  }

  void addRepRangeToSets(int exerciseIndex, int setIndex, String repRange) {
    // Get a copy of all exercises
    final updatedExercises = [...state.plannedExercise];
    final currentExercise = updatedExercises[exerciseIndex];
    final updatedSets = [...currentExercise.sets];

    int? minRep;
    int? maxRep;

    // Check if it contains a '-'
    if (repRange.contains('-')) {
      final parts = repRange.split('-').map((e) => e.trim()).toList();
      if (parts.length == 2) {
        minRep = int.tryParse(parts[0]);
        maxRep = int.tryParse(parts[1]);
      }
    } else {
      // Single value (e.g., "10")
      minRep = int.tryParse(repRange);
      maxRep = minRep;
    }

    // Update the specific set
    final updatedSet = updatedSets[setIndex].copyWith(
      minRep: minRep,
      maxRep: maxRep,
    );
    updatedSets[setIndex] = updatedSet;

    // Update the exercise
    final updatedExercise = currentExercise.copyWith(sets: updatedSets);
    updatedExercises[exerciseIndex] = updatedExercise;

    // Update the state
    state = state.copyWith(plannedExercise: updatedExercises);
  }

  void reset() {
    state = TempSession(name: null, isCompleted: false, plannedExercise: []);
  }
}

import 'package:client/data/model_temp/temp_performed_exercise.dart';
import 'package:client/data/model_temp/temp_performed_session.dart';
import 'package:client/data/model_temp/temp_performed_sets.dart';
import 'package:client/data/model_temp/temp_planned_exercise.dart';
import 'package:client/data/model_temp/temp_planned_sets.dart';
import 'package:client/data/model_temp/temp_session.dart';
import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/planned_exercise.dart';
import 'package:client/data/models/planned_session.dart';
import 'package:client/data/models/planned_set.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final tempPerformedSessionProvider =
    StateNotifierProvider<TempPerformedSessionNotifier, TempPerformedSession>(
      (ref) => TempPerformedSessionNotifier(),
    );

class TempPerformedSessionNotifier extends StateNotifier<TempPerformedSession> {
  TempPerformedSessionNotifier()
    : super(TempPerformedSession(isCompleted: false));

  void addSessionId(int sessionId) {
    state = state.copyWith(id: sessionId);
  }

  void addExercise(TempPerformedExercise exercise) {
    final performedExercise = [...state.performedExercise, exercise];
    state = state.copyWith(performedExercise: performedExercise);
  }

  void deleteExercise(int index) {
    final updatedExercises = [...state.performedExercise];
    updatedExercises.removeAt(index);
    state = state.copyWith(performedExercise: updatedExercises);
  }

  void updateExerciseAt(int index, TempPerformedExercise updatedExercise) {
    final updatedExercises = [...state.performedExercise];
    if (index >= 0 && index < updatedExercises.length) {
      updatedExercises[index] = updatedExercise;
      state = state.copyWith(performedExercise: updatedExercises);
    }
  }

  void addNotesToExercise(int index, String note) {
    final updatedExercises = [...state.performedExercise];
    final target = updatedExercises[index].copyWith(notes: note);

    updatedExercises[index] = target;

    state = state.copyWith(performedExercise: updatedExercises);
  }

  void addSetToExercise(int index, TempPerformedSets set) {
    // 1. Copy current exercise
    final exercise = state.performedExercise[index];

    // 2. Create a new list of sets (immutably add new one)
    final updatedSets = [...exercise.sets, set];

    // 3. Create a new exercise with updated sets
    final updatedExercise = exercise.copyWith(sets: updatedSets);

    // 4. Replace that exercise in the plannedExercise list
    final updatedExercises = [...state.performedExercise];
    updatedExercises[index] = updatedExercise;

    // 5. Update the state immutably
    state = state.copyWith(performedExercise: updatedExercises);
  }

  void addWeightToSets(int exerciseIndex, int setIndex, double weight) {
    // Get a copy of all exercises
    final updatedExercises = [...state.performedExercise];

    // Get the current exercise
    final currentExercise = updatedExercises[exerciseIndex];

    // Copy the sets of that exercise
    final updatedSets = [...currentExercise.sets];

    // Update the specific set with the new weight
    final updatedSet = updatedSets[setIndex].copyWith(actWeight: weight);
    updatedSets[setIndex] = updatedSet;

    // Update the exercise with the modified sets
    final updatedExercise = currentExercise.copyWith(sets: updatedSets);
    updatedExercises[exerciseIndex] = updatedExercise;

    // Update the state with the modified exercises
    state = state.copyWith(performedExercise: updatedExercises);
  }

  void addRepToSets(int exerciseIndex, int setIndex, String repRange) {}

  void reset() {
    state = TempPerformedSession(
      name: "",
      isCompleted: false,
      performedExercise: [],
    );
  }
}

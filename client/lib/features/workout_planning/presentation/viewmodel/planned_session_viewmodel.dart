import 'dart:async';

import 'package:client/core/utils/id_generator.dart';
import 'package:client/features/workout_planning/domain/usecases/add_workout_session.dart';
import 'package:client/features/workout_planning/domain/usecases/get_session_by_id.dart';
import 'package:client/features/workout_planning/presentation/events/session_ui_event.dart';
import 'package:client/features/workout_planning/presentation/state/exercise_state.dart';
import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';
import 'package:client/features/workout_planning/presentation/state/planned_set_state.dart';
import 'package:client/features/workout_planning/presentation/statemappers/exercise_to_planned_mapper.dart';
import 'package:client/features/workout_planning/presentation/statemappers/map_session_failure.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_domain_mapper.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_state_mapper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlannedSessionViewmodel extends StateNotifier<PlannedSessionState> {
  final AddWorkoutSession createWorkoutSession;
  final GetSessionById getSessionById;

  final _events = StreamController<SessionUiEvent>.broadcast();
  Stream<SessionUiEvent> get events => _events.stream;
  PlannedSessionViewmodel(this.createWorkoutSession, this.getSessionById)
    : super(PlannedSessionState.initial());

  void loadSessionById(String sessionId) async {
    reset();
    final session = await getSessionById.call(sessionId);
    state = toStateSession(session);
  }

  Future<void> save() async {
    print("SESSION ID IN SAVE" + state.sessionId);
    // 1️⃣ Ensure ID exists (CREATE ONLY)
    final sessionId = state.sessionId.isNotEmpty
        ? state.sessionId
        : IdGenerator().getId();

    // 2️⃣ Map using a STABLE ID
    final session = mapSession(state.copyWith(sessionId: sessionId));

    // 3️⃣ Save (repo decides create vs edit)
    final result = await createWorkoutSession(session);

    result.fold(
      (failure) {
        _events.add(ShowError(mapSessionFailure(failure)));
      },
      (_) {
        // 4️⃣ Reset ONLY on success
        state = PlannedSessionState.initial();
        _events.add(SaveSuccess("Session saved!"));
        reset();
      },
    );
  }

  void addName(String newName) {
    state = state.copyWith(name: newName);
  }

  void removeName() {
    state = state.copyWith(name: "");
  }

  void addExercise(ExerciseState exercise) {
    final plannedExercise = toPlannedExercise(exercise);

    state = state.copyWith(exercises: [...state.exercises, plannedExercise]);
  }

  void deleteExercise(int index) {
    final updatedExercises = [...state.exercises];
    updatedExercises.removeAt(index);
    state = state.copyWith(exercises: updatedExercises);
  }

  void updateExerciseAt(int index, ExerciseState updatedExercise) {
    final updatedExercises = [...state.exercises];
    if (index >= 0 && index < updatedExercises.length) {
      final plannedExercise = toPlannedExercise(updatedExercise);
      updatedExercises[index] = plannedExercise;
      state = state.copyWith(exercises: updatedExercises);
    }
  }

  void addNotesToExercise(int index, String note) {
    final updatedExercises = [...state.exercises];
    final target = updatedExercises[index].copyWith(notes: note);

    updatedExercises[index] = target;

    state = state.copyWith(exercises: updatedExercises);
  }

  void addSetToExercise(int index) {
    final sets = PlannedSetState.defaultSet(); // or default()
    // 1. Copy current exercise
    final exercise = state.exercises[index];

    // 2. Create a new list of sets (immutably add new one)
    final updatedSets = [...exercise.sets, sets];

    // 3. Create a new exercise with updated sets
    final updatedExercise = exercise.copyWith(sets: updatedSets);

    // 4. Replace that exercise in the plannedExercise list
    final updatedExercises = [...state.exercises];
    updatedExercises[index] = updatedExercise;

    // 5. Update the state immutably
    state = state.copyWith(exercises: updatedExercises);
  }

  void deleteSet(int exerciseIndex, int setIndex) {
    final updatedExercises = [...state.exercises];
    final currentExercise = updatedExercises[exerciseIndex];
    currentExercise.sets.removeAt(setIndex);
    state = state.copyWith(exercises: updatedExercises);
  }

  void addWeightToSets(int exerciseIndex, int setIndex, String weight) {
    final double? rweight = double.tryParse(weight);
    if (rweight == null) return;
    // Get a copy of all exercises
    final updatedExercises = [...state.exercises];

    // Get the current exercise
    final currentExercise = updatedExercises[exerciseIndex];

    // Copy the sets of that exercise
    final updatedSets = [...currentExercise.sets];

    // Update the specific set with the new weight
    final updatedSet = updatedSets[setIndex].copyWith(estWeight: rweight);
    updatedSets[setIndex] = updatedSet;

    // Update the exercise with the modified sets
    final updatedExercise = currentExercise.copyWith(sets: updatedSets);
    updatedExercises[exerciseIndex] = updatedExercise;

    // Update the state with the modified exercises
    state = state.copyWith(exercises: updatedExercises);
  }

  void addRepRangeToSets(int exerciseIndex, int setIndex, String repRange) {
    // Get a copy of all exercises
    final updatedExercises = [...state.exercises];
    final currentExercise = updatedExercises[exerciseIndex];
    final updatedSets = [...currentExercise.sets];

    int? minRep;
    int? maxRep;

    // Check if it contains a '-'
    if (repRange.contains('-')) {
      final parts = repRange.split('-').map((e) => e.trim()).toList();
      if (parts.length == 2) {
        if (int.tryParse(parts[0]) == null && int.tryParse(parts[1]) != null) {
          minRep = int.tryParse(parts[1]);
          maxRep = minRep;
        } else if (int.tryParse(parts[0]) != null &&
            int.tryParse(parts[1]) == null) {
          minRep = int.tryParse(parts[0]);
          maxRep = minRep;
        } else if (int.tryParse(parts[0]) == null &&
            int.tryParse(parts[1]) == null) {
          minRep = null;
          maxRep = null;
        } else {
          minRep = int.tryParse(parts[0]);
          maxRep = int.tryParse(parts[1]);
        }
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
    state = state.copyWith(exercises: updatedExercises);
  }

  // void addActWeightToSets(int exerciseIndex, int setIndex, double weight) {
  //   // Get a copy of all exercises
  //   final updatedExercises = [...state.exercises];

  //   // Get the current exercise
  //   final currentExercise = updatedExercises[exerciseIndex];

  //   // Copy the sets of that exercise
  //   final updatedSets = [...currentExercise.sets];

  //   // Update the specific set with the new weight
  //   final updatedSet = updatedSets[setIndex].copyWith(estWeight: weight);
  //   updatedSets[setIndex] = updatedSet;

  //   // Update the exercise with the modified sets
  //   final updatedExercise = currentExercise.copyWith(sets: updatedSets);
  //   updatedExercises[exerciseIndex] = updatedExercise;

  //   // Update the state with the modified exercises
  //   state = state.copyWith(exercises: updatedExercises);
  // }

  // void addActRepToSets(int exerciseIndex, int setIndex, int actRep) {
  //   // Get a copy of all exercises
  //   final updatedExercises = [...state.exercises];

  //   // Get the current exercise
  //   final currentExercise = updatedExercises[exerciseIndex];

  //   // Copy the sets of that exercise
  //   final updatedSets = [...currentExercise.sets];

  //   // Update the specific set with the new weight
  //   final updatedSet = updatedSets[setIndex].copyWith(actRep: actRep);
  //   updatedSets[setIndex] = updatedSet;

  //   // Update the exercise with the modified sets
  //   final updatedExercise = currentExercise.copyWith(sets: updatedSets);
  //   updatedExercises[exerciseIndex] = updatedExercise;

  //   // Update the state with the modified exercises
  //   state = state.copyWith(plannedExercise: updatedExercises);
  // }

  void reset() {
    state = PlannedSessionState(name: '', exercises: [], sessionId: "");
  }
}

import 'dart:async';

import 'package:client/core/presentation/abstract/add_exercise_absract.dart';
import 'package:client/core/presentation/abstract/update_exercise_abstract.dart';
import 'package:client/core/utils/id_generator.dart';
import 'package:client/features/workout_planning/domain/usecases/add_workout_session.dart';
import 'package:client/features/workout_planning/domain/usecases/get_session_by_id.dart';
import 'package:client/features/workout_planning/presentation/events/planned_session_ui_event.dart';
import 'package:client/core/presentation/state/exercise_state.dart';
import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';
import 'package:client/features/workout_planning/presentation/state/planned_set_state.dart';
import 'package:client/features/workout_planning/presentation/statemappers/exercise_to_planned_mapper.dart';
import 'package:client/features/workout_planning/presentation/statemappers/map_planned_session_failure.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_domain_mapper.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_state_mapper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlannedSessionViewmodel extends StateNotifier<PlannedSessionState>
    implements AddExerciseAbsract, UpdateExerciseAbstract {
  final AddWorkoutSession createWorkoutSession;
  final GetSessionById getSessionById;

  final _events = StreamController<PlannedSessionUiEvent>.broadcast();
  Stream<PlannedSessionUiEvent> get events => _events.stream;

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
        _events.add(ShowError(mapPlannedSessionFailure(failure)));
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

  @override
  void addExercise(ExerciseState exercise) {
    final plannedExercise = toPlannedExercise(exercise, []);

    state = state.copyWith(exercises: [...state.exercises, plannedExercise]);
  }

  void deleteExercise(int index) {
    final updatedExercises = [...state.exercises];
    updatedExercises.removeAt(index);
    state = state.copyWith(exercises: updatedExercises);
  }

  @override
  void updateExerciseAt(int index, ExerciseState updatedExercise) {
    final updatedExercises = [...state.exercises];
    if (index >= 0 && index < updatedExercises.length) {
      final oldPerformedExercise = updatedExercises[index];
      final plannedExercise = toPlannedExercise(
        updatedExercise,
        oldPerformedExercise.sets,
      );
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

    final updatedSets = [...currentExercise.sets];
    updatedSets.removeAt(setIndex);

    updatedExercises[exerciseIndex] = currentExercise.copyWith(
      sets: updatedSets,
    );

    state = state.copyWith(exercises: updatedExercises);
  }

  void addWeightToSets(int exerciseIndex, int setIndex, String weight) {
    final double? parsedWeight = double.tryParse(weight);
    if (parsedWeight == null) return;

    final updatedExercises = [...state.exercises];
    final currentExercise = updatedExercises[exerciseIndex];
    final updatedSets = [...currentExercise.sets];
    updatedSets[setIndex] = updatedSets[setIndex].copyWith(
      estWeight: parsedWeight,
    );

    updatedExercises[exerciseIndex] = currentExercise.copyWith(
      sets: updatedSets,
    );

    state = state.copyWith(exercises: updatedExercises);
  }

  void addRepRangeToSets(int exerciseIndex, int setIndex, String repRange) {
    final updatedExercises = [...state.exercises];
    final currentExercise = updatedExercises[exerciseIndex];

    int? minRep;
    int? maxRep;

    final cleaned = repRange.trim();

    if (cleaned.isEmpty) {
      minRep = null;
      maxRep = null;
    } else if (cleaned.contains('-')) {
      final parts = cleaned.split('-').map((e) => e.trim()).toList();

      if (parts.length == 2) {
        final first = int.tryParse(parts[0]);
        final second = int.tryParse(parts[1]);

        if (first != null && second != null) {
          minRep = first;
          maxRep = second;
        } else if (first != null) {
          minRep = first;
          maxRep = first;
        } else if (second != null) {
          minRep = second;
          maxRep = second;
        } else {
          minRep = null;
          maxRep = null;
        }
      }
    } else {
      final single = int.tryParse(cleaned);
      minRep = single;
      maxRep = single;
    }
    final updatedSets = [...currentExercise.sets];
    updatedSets[setIndex] = updatedSets[setIndex].copyWith(
      minRep: minRep,
      maxRep: maxRep,
    );

    updatedExercises[exerciseIndex] = currentExercise.copyWith(
      sets: updatedSets,
    );

    state = state.copyWith(exercises: updatedExercises);
  }

  void reset() {
    state = PlannedSessionState(name: '', exercises: [], sessionId: "");
  }
}

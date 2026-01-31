import 'dart:async';

import 'package:client/core/presentation/abstract/add_exercise_absract.dart';
import 'package:client/core/presentation/abstract/update_exercise_abstract.dart';
import 'package:client/core/presentation/state/exercise_state.dart';
import 'package:client/features/workout_logging/data/mappers/domain_to_isar_performed_session_mapper.dart';
import 'package:client/features/workout_logging/data/models/performed_exercise_isar.dart';
import 'package:client/features/workout_logging/domain/usecases/add_performed_session.dart';
import 'package:client/features/workout_logging/presentation/events/performed_session_io_event.dart';
import 'package:client/features/workout_logging/presentation/state/performed_set_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_session_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_stats_state.dart';
import 'package:client/features/workout_logging/presentation/statemappers/map_performed_session.dart';
import 'package:client/features/workout_logging/presentation/statemappers/map_performed_session_failure.dart';
import 'package:client/features/workout_logging/presentation/statemappers/to_performed_exercise_state.dart';
import 'package:client/features/workout_logging/presentation/statemappers/to_workout_logging_state.dart';
import 'package:client/features/workout_planning/domain/usecases/get_session_by_id.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutLoggingViewModel extends StateNotifier<PerformedSessionState>
    implements AddExerciseAbsract, UpdateExerciseAbstract {
  GetSessionById getSessionById;
  AddPerformedSession addPerformedSession;

  final _events = StreamController<PerformedSessionUiEvent>.broadcast();
  Stream<PerformedSessionUiEvent> get events => _events.stream;

  WorkoutLoggingViewModel(this.getSessionById, this.addPerformedSession)
    : super(PerformedSessionState.initial());

  Future<void> loadPlannedSessionToLogging(String sessionId) async {
    final session = await getSessionById.call(sessionId);

    state = toWorkoutLoggingState(session);
  }

  Future<void> save() async {
    final performedSession = mapPerformedSession(state);

    final result = await addPerformedSession(performedSession);

    result.fold(
      (failure) {
        _events.add(ShowError(mapPerformedSessionFailure(failure)));
      },
      (_) {
        // 4️⃣ Reset ONLY on success
        state = PerformedSessionState.initial();
        _events.add(SaveSuccess("Session saved!"));
        reset();
      },
    );
  }

  void addSetToExercise(int index) {
    final sets = PerformedSetState.defaultSet(); // or default()
    // 1. Copy current exercise
    final exercise = state.performedExercise[index];

    // 2. Create a new list of sets (immutably add new one)
    final updatedSets = [...exercise.sets, sets];

    // 3. Create a new exercise with updated sets
    final updatedExercise = exercise.copyWith(sets: updatedSets);

    // 4. Replace that exercise in the plannedExercise list
    final updatedExercises = [...state.performedExercise];
    updatedExercises[index] = updatedExercise;

    // 5. Update the state immutably
    state = state.copyWith(performedExercise: updatedExercises);
  }

  @override
  void addExercise(ExerciseState exercise) {
    final performedExercise = toPerformedExerciseState(exercise, []);

    state = state.copyWith(
      performedExercise: [...state.performedExercise, performedExercise],
    );
  }

  void deleteExercise(int index) {
    final updatedExercises = [...state.performedExercise];
    updatedExercises.removeAt(index);
    state = state.copyWith(performedExercise: updatedExercises);
  }

  @override
  void updateExerciseAt(int index, ExerciseState updatedExercise) {
    final updatedExercises = [...state.performedExercise];
    if (index >= 0 && index < updatedExercises.length) {
      final oldPerformedExercise = updatedExercises[index];
      final plannedExercise = toPerformedExerciseState(
        updatedExercise,
        oldPerformedExercise.sets,
      );
      updatedExercises[index] = plannedExercise;
      state = state.copyWith(performedExercise: updatedExercises);
    }
  }

  void addNotesToExercise(int index, String note) {
    final updatedExercises = [...state.performedExercise];
    final target = updatedExercises[index].copyWith(notes: note);

    updatedExercises[index] = target;

    state = state.copyWith(performedExercise: updatedExercises);
  }

  void deleteSet(int exerciseIndex, int setIndex) {
    final updatedExercises = [...state.performedExercise];
    final currentExercise = updatedExercises[exerciseIndex];
    currentExercise.sets.removeAt(setIndex);
    state = state.copyWith(performedExercise: updatedExercises);
  }

  void addWeightToSets(int exerciseIndex, int setIndex, String weight) {
    final double? rweight = double.tryParse(weight);
    if (rweight == null) return;
    // Get a copy of all exercises
    final updatedExercises = [...state.performedExercise];

    // Get the current exercise
    final currentExercise = updatedExercises[exerciseIndex];

    // Copy the sets of that exercise
    final updatedSets = [...currentExercise.sets];

    // Update the specific set with the new weight
    final updatedSet = updatedSets[setIndex].copyWith(actWeight: rweight);
    updatedSets[setIndex] = updatedSet;

    // Update the exercise with the modified sets
    final updatedExercise = currentExercise.copyWith(sets: updatedSets);
    updatedExercises[exerciseIndex] = updatedExercise;

    // Update the state with the modified exercises
    state = state.copyWith(performedExercise: updatedExercises);
  }

  void addRepRangeToSets(int exerciseIndex, int setIndex, String repRange) {
    // Get a copy of all exercises
    final updatedExercises = [...state.performedExercise];
    final currentExercise = updatedExercises[exerciseIndex];
    final updatedSets = [...currentExercise.sets];

    // Update the specific set
    final updatedSet = updatedSets[setIndex].copyWith(
      actRep: int.tryParse(repRange),
    );
    updatedSets[setIndex] = updatedSet;

    // Update the exercise
    final updatedExercise = currentExercise.copyWith(sets: updatedSets);
    updatedExercises[exerciseIndex] = updatedExercise;

    // Update the state
    state = state.copyWith(performedExercise: updatedExercises);
  }

  void isSetCompleted(int exerciseIndex, int setIndex) {
    // Get a copy of all exercises
    final updatedExercises = [...state.performedExercise];
    final currentExercise = updatedExercises[exerciseIndex];
    final updatedSets = [...currentExercise.sets];

    // Update the specific set
    final updatedSet = updatedSets[setIndex].copyWith(
      isCompleted: !updatedSets[setIndex].isCompleted,
    );
    updatedSets[setIndex] = updatedSet;

    // Update the exercise
    final updatedExercise = currentExercise.copyWith(sets: updatedSets);
    updatedExercises[exerciseIndex] = updatedExercise;

    // Update the state
    state = state.copyWith(performedExercise: updatedExercises);
  }

  void addStats(double lbs, int reps) {
    final double volume = lbs * reps;

    final updatedStats = state.performedStats.copyWith(
      totalVolume: state.performedStats.totalVolume + volume,
      totalSets: state.performedStats.totalSets + 1,
    );
    state = state.copyWith(performedStats: updatedStats);
  }

  void removeStats(double lbs, int reps) {
    final double volume = lbs * reps;

    final updatedStats = state.performedStats.copyWith(
      totalVolume: state.performedStats.totalVolume - volume,
      totalSets: state.performedStats.totalSets - 1,
    );
    state = state.copyWith(performedStats: updatedStats);
  }

  void addDuration(int seconds) {
    final updatedStats = state.performedStats.copyWith(totalSeconds: seconds);

    state = state.copyWith(performedStats: updatedStats);
  }

  void reset() {
    state = PerformedSessionState.initial();
  }
}

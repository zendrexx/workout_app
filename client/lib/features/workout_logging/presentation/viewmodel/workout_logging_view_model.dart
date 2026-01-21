import 'package:client/core/presentation/abstract/add_exercise_absract.dart';
import 'package:client/core/presentation/abstract/update_exercise_abstract.dart';
import 'package:client/core/presentation/state/exercise_state.dart';
import 'package:client/data/models/performed_exercise.dart';
import 'package:client/features/workout_logging/presentation/state/performed_set_state.dart';
import 'package:client/features/workout_logging/presentation/state/workout_logging_state.dart';
import 'package:client/features/workout_logging/presentation/statemappers/to_performed_exercise_state.dart';
import 'package:client/features/workout_logging/presentation/statemappers/to_workout_logging_state.dart';
import 'package:client/features/workout_planning/domain/usecases/get_session_by_id.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutLoggingViewModel extends StateNotifier<WorkoutLoggingState>
    implements AddExerciseAbsract, UpdateExerciseAbstract {
  GetSessionById getSessionById;
  WorkoutLoggingViewModel(this.getSessionById)
    : super(WorkoutLoggingState.initial());

  Future<void> loadPlannedSessionToLogging(String sessionId) async {
    final session = await getSessionById.call(sessionId);

    state = toWorkoutLoggingState(session);
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

  // void addNotesToExercise(int index, String note) {
  //   final updatedExercises = [...state.exercises];
  //   final target = updatedExercises[index].copyWith(notes: note);

  //   updatedExercises[index] = target;

  //   state = state.copyWith(exercises: updatedExercises);
  // }

  void deleteSet(int exerciseIndex, int setIndex) {
    final updatedExercises = [...state.performedExercise];
    final currentExercise = updatedExercises[exerciseIndex];
    currentExercise.sets.removeAt(setIndex);
    state = state.copyWith(performedExercise: updatedExercises);
  }

  // void addWeightToSets(int exerciseIndex, int setIndex, String weight) {
  //   final double? rweight = double.tryParse(weight);
  //   if (rweight == null) return;
  //   // Get a copy of all exercises
  //   final updatedExercises = [...state.exercises];

  //   // Get the current exercise
  //   final currentExercise = updatedExercises[exerciseIndex];

  //   // Copy the sets of that exercise
  //   final updatedSets = [...currentExercise.sets];

  //   // Update the specific set with the new weight
  //   final updatedSet = updatedSets[setIndex].copyWith(estWeight: rweight);
  //   updatedSets[setIndex] = updatedSet;

  //   // Update the exercise with the modified sets
  //   final updatedExercise = currentExercise.copyWith(sets: updatedSets);
  //   updatedExercises[exerciseIndex] = updatedExercise;

  //   // Update the state with the modified exercises
  //   state = state.copyWith(exercises: updatedExercises);
  // }

  // void addRepRangeToSets(int exerciseIndex, int setIndex, String repRange) {
  //   // Get a copy of all exercises
  //   final updatedExercises = [...state.exercises];
  //   final currentExercise = updatedExercises[exerciseIndex];
  //   final updatedSets = [...currentExercise.sets];

  //   int? minRep;
  //   int? maxRep;

  //   // Check if it contains a '-'
  //   if (repRange.contains('-')) {
  //     final parts = repRange.split('-').map((e) => e.trim()).toList();
  //     if (parts.length == 2) {
  //       if (int.tryParse(parts[0]) == null && int.tryParse(parts[1]) != null) {
  //         minRep = int.tryParse(parts[1]);
  //         maxRep = minRep;
  //       } else if (int.tryParse(parts[0]) != null &&
  //           int.tryParse(parts[1]) == null) {
  //         minRep = int.tryParse(parts[0]);
  //         maxRep = minRep;
  //       } else if (int.tryParse(parts[0]) == null &&
  //           int.tryParse(parts[1]) == null) {
  //         minRep = null;
  //         maxRep = null;
  //       } else {
  //         minRep = int.tryParse(parts[0]);
  //         maxRep = int.tryParse(parts[1]);
  //       }
  //     }
  //   } else {
  //     // Single value (e.g., "10")
  //     minRep = int.tryParse(repRange);
  //     maxRep = minRep;
  //   }

  //   // Update the specific set
  //   final updatedSet = updatedSets[setIndex].copyWith(
  //     minRep: minRep,
  //     maxRep: maxRep,
  //   );
  //   updatedSets[setIndex] = updatedSet;

  //   // Update the exercise
  //   final updatedExercise = currentExercise.copyWith(sets: updatedSets);
  //   updatedExercises[exerciseIndex] = updatedExercise;

  //   // Update the state
  //   state = state.copyWith(exercises: updatedExercises);
  // }

  // void reset() {
  //   state = PlannedSessionState(name: '', exercises: [], sessionId: "");
  // }
}

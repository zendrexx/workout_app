import 'dart:async';

import 'package:client/core/presentation/abstract/add_exercise_absract.dart';
import 'package:client/core/presentation/abstract/update_exercise_abstract.dart';
import 'package:client/core/presentation/state/exercise_state.dart';
import 'package:client/features/workout_logging/domain/usecases/add_performed_session.dart';
import 'package:client/features/workout_logging/presentation/events/performed_session_io_event.dart';
import 'package:client/features/workout_logging/presentation/state/performed_set_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_session_state.dart';
import 'package:client/features/workout_logging/presentation/statemappers/map_performed_session.dart';
import 'package:client/features/workout_logging/presentation/statemappers/map_performed_session_failure.dart';
import 'package:client/features/workout_logging/presentation/statemappers/map_performed_session_to_template.dart';
import 'package:client/features/workout_logging/presentation/statemappers/to_performed_exercise_state.dart';
import 'package:client/features/workout_logging/presentation/statemappers/to_workout_logging_state.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/domain/usecases/add_workout_session.dart';
import 'package:client/features/workout_planning/domain/usecases/get_session_by_id.dart';
import 'package:client/features/workout_program/domain/services/program_schedule.dart';
import 'package:client/features/workout_program/domain/usecases/get_active_program.dart';
import 'package:client/features/workout_program/domain/usecases/get_program_by_id.dart';
import 'package:client/features/workout_program/domain/usecases/save_active_program.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutLoggingViewModel extends StateNotifier<PerformedSessionState>
    implements AddExerciseAbsract, UpdateExerciseAbstract {
  GetSessionById getSessionById;
  AddPerformedSession addPerformedSession;
  GetProgramById getProgramById;
  GetActiveProgram getActiveProgram;
  SaveActiveProgram saveActiveProgram;
  AddWorkoutSession addWorkoutSession;

  final _events = StreamController<PerformedSessionUiEvent>.broadcast();
  Stream<PerformedSessionUiEvent> get events => _events.stream;

  /// Set when this workout was launched from an active program, so progress
  /// can be advanced after it's finished.
  _ProgramContext? _programContext;

  WorkoutLoggingViewModel(
    this.getSessionById,
    this.addPerformedSession,
    this.getProgramById,
    this.getActiveProgram,
    this.saveActiveProgram,
    this.addWorkoutSession,
  ) : super(PerformedSessionState.initial());

  Future<void> loadPlannedSessionToLogging(String sessionId) async {
    final session = await getSessionById.call(sessionId);

    state = toWorkoutLoggingState(session);
  }

  void addName(String newName) {
    state = state.copyWith(name: newName);
  }

  /// Loads the program session scheduled at (week, day) into the logging state.
  /// A [ProgramSession] is structurally a planned session plus a day number,
  /// so it reuses the existing planned -> logging conversion.
  Future<void> loadProgramWorkout(String programId, int week, int day) async {
    final program = await getProgramById.call(programId);
    final session = sessionForDay(program, week, day);
    if (session == null) return;

    final planned = PlannedWorkoutSession(
      sessionId: session.sessionId,
      name: session.name,
      createdAt: session.createdAt,
      exercises: session.exercises,
    );

    state = toWorkoutLoggingState(planned);
    _programContext = _ProgramContext(programId, week, day);
  }

  Future<void> save() async {
    final performedSession = mapPerformedSession(state);

    final result = await addPerformedSession(performedSession);

    await result.fold(
      (failure) async {
        _events.add(ShowError(mapPerformedSessionFailure(failure)));
      },
      (_) async {
        // Ad-hoc ("Start Empty") workouts have no planned session behind
        // them, so also save them as a reusable template.
        if (state.plannedSessionId.isEmpty) {
          await _saveAsTemplate(state);
        }
        // Advance the active program past the day we just completed.
        final ctx = _programContext;
        if (ctx != null) {
          await _advanceProgramProgress(ctx);
          _programContext = null;
        }
        // Reset ONLY on success
        state = PerformedSessionState.initial();
        _events.add(SaveSuccess("Session saved!"));
        reset();
      },
    );
  }

  /// Best-effort: turns a completed ad-hoc workout into a reusable
  /// [PlannedWorkoutSession] template. Failures here don't affect the
  /// already-saved workout history entry.
  Future<void> _saveAsTemplate(PerformedSessionState state) async {
    final template = mapPerformedSessionToTemplate(state);
    if (!template.hasExercise) return;
    await addWorkoutSession(template);
  }

  Future<void> _advanceProgramProgress(_ProgramContext ctx) async {
    final active = await getActiveProgram.call();
    if (active == null || active.templateProgramId != ctx.programId) return;

    final program = await getProgramById.call(ctx.programId);
    final next = nextDayPosition(program, ctx.week, ctx.day);

    final updated = next == null
        ? active.copyWith(isCompleted: true)
        : active.copyWith(currentWeek: next.week, currentDay: next.day);

    await saveActiveProgram.call(updated);
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

  /// RPE is optional, so an unparsable/blank value simply leaves it unset
  /// rather than blocking the update like weight/reps do.
  void addRpeToSets(int exerciseIndex, int setIndex, String rpe) {
    final updatedExercises = [...state.performedExercise];
    final currentExercise = updatedExercises[exerciseIndex];
    final updatedSets = [...currentExercise.sets];

    final updatedSet = updatedSets[setIndex].copyWith(
      actRpe: double.tryParse(rpe),
    );
    updatedSets[setIndex] = updatedSet;

    final updatedExercise = currentExercise.copyWith(sets: updatedSets);
    updatedExercises[exerciseIndex] = updatedExercise;

    state = state.copyWith(performedExercise: updatedExercises);
  }

  /// Best-effort parse of a planned rep target ("8-10" / "8") into a number,
  /// used when auto-filling actual reps for the "complete all" action.
  int _parsePlannedReps(String estRep) {
    final firstToken = estRep.split('-').first.trim();
    return int.tryParse(firstToken) ?? 0;
  }

  /// Marks every set of an exercise as completed, filling any blank actuals
  /// from the planned targets (weight -> estimated, reps -> planned range).
  void completeAllSets(int exerciseIndex) {
    final updatedExercises = [...state.performedExercise];
    final exercise = updatedExercises[exerciseIndex];

    var addedVolume = 0.0;
    var addedSets = 0;

    final updatedSets = exercise.sets.map((set) {
      if (set.isCompleted) return set;
      final weight = set.actWeight > 0 ? set.actWeight : set.estWeight;
      final reps = set.actRep > 0 ? set.actRep : _parsePlannedReps(set.estRep);
      addedVolume += weight * reps;
      addedSets += 1;
      return set.copyWith(actWeight: weight, actRep: reps, isCompleted: true);
    }).toList();

    updatedExercises[exerciseIndex] = exercise.copyWith(sets: updatedSets);

    final updatedStats = state.performedStats.copyWith(
      totalVolume: state.performedStats.totalVolume + addedVolume,
      totalSets: state.performedStats.totalSets + addedSets,
    );

    state = state.copyWith(
      performedExercise: updatedExercises,
      performedStats: updatedStats,
    );
  }

  /// Reverses [completeAllSets] for an exercise, removing the stats it added.
  void uncompleteAllSets(int exerciseIndex) {
    final updatedExercises = [...state.performedExercise];
    final exercise = updatedExercises[exerciseIndex];

    var removedVolume = 0.0;
    var removedSets = 0;

    final updatedSets = exercise.sets.map((set) {
      if (!set.isCompleted) return set;
      removedVolume += set.actWeight * set.actRep;
      removedSets += 1;
      return set.copyWith(isCompleted: false);
    }).toList();

    updatedExercises[exerciseIndex] = exercise.copyWith(sets: updatedSets);

    final updatedStats = state.performedStats.copyWith(
      totalVolume: state.performedStats.totalVolume - removedVolume,
      totalSets: state.performedStats.totalSets - removedSets,
    );

    state = state.copyWith(
      performedExercise: updatedExercises,
      performedStats: updatedStats,
    );
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

/// Identifies the active-program day a workout was launched from.
class _ProgramContext {
  final String programId;
  final int week;
  final int day;
  const _ProgramContext(this.programId, this.week, this.day);
}

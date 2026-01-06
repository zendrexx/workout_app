// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/features/workout_planning/presentation/state/planned_set_state.dart';

class PlannedExerciseState {
  final String? exerciseName;
  final String? exercisePath;
  final String? equipment;
  final String? notes;
  final List<PlannedSetState> sets;
  PlannedExerciseState({
    required this.sets,
    this.equipment,
    this.exerciseName,
    this.exercisePath,
    this.notes,
  });

  PlannedExerciseState copyWith({
    String? exerciseName,
    String? exercisePath,
    String? equipment,
    String? notes,
    List<PlannedSetState>? sets,
  }) {
    return PlannedExerciseState(
      exerciseName: exerciseName ?? this.exerciseName,
      exercisePath: exercisePath ?? this.exercisePath,
      equipment: equipment ?? this.equipment,
      notes: notes ?? this.notes,
      sets: sets ?? this.sets,
    );
  }
}

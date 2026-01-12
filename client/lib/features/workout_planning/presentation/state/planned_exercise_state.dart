// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/features/workout_planning/presentation/state/planned_set_state.dart';

class PlannedExerciseState {
  final String exerciseName;
  final String imagePath;
  final String equipment;
  final String notes;
  final List<PlannedSetState> sets;
  PlannedExerciseState({
    required this.sets,
    required this.equipment,
    required this.exerciseName,
    required this.imagePath,
    required this.notes,
  });

  PlannedExerciseState copyWith({
    String? exerciseName,
    String? imagePath,
    String? equipment,
    String? notes,
    List<PlannedSetState>? sets,
  }) {
    return PlannedExerciseState(
      exerciseName: exerciseName ?? this.exerciseName,
      imagePath: imagePath ?? this.imagePath,
      equipment: equipment ?? this.equipment,
      notes: notes ?? this.notes,
      sets: sets ?? this.sets,
    );
  }
}

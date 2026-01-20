// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/features/workout_logging/presentation/state/performed_set_state.dart';

class PerformedExerciseState {
  String exerciseName;
  String imagePath;
  String equipment;
  String exId;
  String notes;
  List<PerformedSetState> sets;
  PerformedExerciseState({
    required this.exerciseName,
    required this.imagePath,
    required this.equipment,
    required this.exId,
    required this.notes,
    required this.sets,
  });

  PerformedExerciseState copyWith({
    String? exerciseName,
    String? imagePath,
    String? equipment,
    String? exId,
    String? notes,
    List<PerformedSetState>? sets,
  }) {
    return PerformedExerciseState(
      exerciseName: exerciseName ?? this.exerciseName,
      imagePath: imagePath ?? this.imagePath,
      equipment: equipment ?? this.equipment,
      exId: exId ?? this.exId,
      notes: notes ?? this.notes,
      sets: sets ?? this.sets,
    );
  }
}

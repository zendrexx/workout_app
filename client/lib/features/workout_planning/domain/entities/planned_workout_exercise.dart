// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/features/workout_planning/domain/entities/planned_workout_set.dart';

class PlannedWorkoutExercise {
  String exId;
  String exerciseName;
  String? exercisePath;
  String? equipment;
  String? notes;
  final List<PlannedWorkoutSet> sets;

  PlannedWorkoutExercise({
    required this.exId,
    required this.exerciseName,
    this.exercisePath,
    this.equipment,
    this.notes,
    required this.sets,
  });

  double get getTotalEstVolumeExercise {
    double total = 0;
    for (final s in sets) {
      total += s.getEstVolume;
    }
    return total;
  }

  PlannedWorkoutExercise copyWith({
    String? exId,
    String? exerciseName,
    String? exercisePath,
    String? equipment,
    String? notes,
    List<PlannedWorkoutSet>? sets,
  }) {
    return PlannedWorkoutExercise(
      exId: exId ?? this.exId,
      exerciseName: exerciseName ?? this.exerciseName,
      exercisePath: exercisePath ?? this.exercisePath,
      equipment: equipment ?? this.equipment,
      notes: notes ?? this.notes,
      sets: sets ?? this.sets,
    );
  }
}

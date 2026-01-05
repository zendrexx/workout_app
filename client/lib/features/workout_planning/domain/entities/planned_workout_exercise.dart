import 'package:client/features/workout_planning/domain/entities/planned_workout_set.dart';

class PlannedWorkoutExercise {
  String? exId;
  String? exerciseName;
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
}

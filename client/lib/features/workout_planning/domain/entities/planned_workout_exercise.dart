import 'package:client/features/workout_planning/domain/entities/planned_workout_set.dart';

class PlannedWorkoutExercise {
  final String id;
  final String name;
  final List<PlannedWorkoutSet> sets;

  PlannedWorkoutExercise({
    required this.id,
    required this.name,
    required this.sets,
  });

  double get getTotalVolumeExercise {
    double total = 0;
    for (final s in sets) {
      total += s.getVolume;
    }
    return total;
  }
}

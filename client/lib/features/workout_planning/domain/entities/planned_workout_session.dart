import 'package:client/features/workout_planning/domain/entities/planned_workout_exercise.dart';

class PlannedWorkoutSession {
  final String id;
  final String name;
  final DateTime startedAt;
  final List<PlannedWorkoutExercise> exercises;

  PlannedWorkoutSession({
    required this.id,
    required this.name,
    required this.startedAt,
    required this.exercises,
  });

  bool get isValid {
    return name.isNotEmpty && exercises.isNotEmpty;
  }

  int get getTotalSets {
    int totalSets = 0;
    for (final e in exercises) {
      totalSets += e.sets.length;
    }
    return totalSets;
  }

  double get getTotalVolume {
    double total = 0;
    for (final e in exercises) {
      total += e.getTotalVolumeExercise;
    }
    return total;
  }
}

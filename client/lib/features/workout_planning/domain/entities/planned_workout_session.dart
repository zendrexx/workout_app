// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/data/models/workout_stats.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_exercise.dart';

class PlannedWorkoutSession {
  final String id;
  final String name;
  final DateTime createdAt;
  final List<PlannedWorkoutExercise> exercises;

  PlannedWorkoutSession({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.exercises,
  });

  bool get hasName {
    return name.trim().isNotEmpty;
  }

  bool get hasExercise {
    return exercises.isNotEmpty;
  }

  int get getTotalSets {
    int totalSets = 0;
    for (final e in exercises) {
      totalSets += e.sets.length;
    }
    return totalSets;
  }

  double get getTotalEstVolume {
    double total = 0;
    for (final e in exercises) {
      total += e.getTotalEstVolumeExercise;
    }
    return total;
  }

  PlannedWorkoutSession copyWith({
    String? id,
    String? name,
    DateTime? createdAt,
    List<PlannedWorkoutExercise>? exercises,
  }) {
    return PlannedWorkoutSession(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      exercises: exercises ?? this.exercises,
    );
  }
}

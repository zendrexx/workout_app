// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/features/workout_logging/domain/entities/performed_set.dart';

class PerformedExercise {
  final String exerciseName;
  final String imagePath;
  final String equipment;
  final String exId;
  final String notes;
  final List<PerformedSet> sets;

  PerformedExercise({
    required this.exerciseName,
    required this.imagePath,
    required this.equipment,
    required this.exId,
    required this.notes,
    required this.sets,
  });

  bool get hasSet {
    return sets.isNotEmpty;
  }

  int get getCompletedSetsCount {
    return sets.where((s) => s.isCompleted).length;
  }

  bool get hasCompletedSet => sets.any((s) => s.isCompleted);
}

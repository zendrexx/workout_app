import 'package:client/features/workout_planning/domain/entities/planned_workout_exercise.dart';

class ProgramSession {
  final String sessionId;
  final String name;
  final DateTime createdAt;
  final int dayNumber;
  final List<PlannedWorkoutExercise> exercises;

  ProgramSession({
    required this.sessionId,
    required this.name,
    required this.createdAt,
    required this.dayNumber,
    required this.exercises,
  });
}

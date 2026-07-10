import 'package:client/features/workout_planning/presentation/state/planned_exercise_state.dart';

class ProgramSessionState {
  final String sessionId;
  final DateTime createdAt;
  final int dayNumber;
  final String sessionName;
  final List<PlannedExerciseState> exercises;

  ProgramSessionState({
    required this.sessionId,
    required this.createdAt,
    required this.sessionName,
    required this.exercises,
    required this.dayNumber,
  });
}

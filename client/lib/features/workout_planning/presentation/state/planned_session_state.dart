// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/features/workout_planning/presentation/state/planned_exercise_state.dart';

class PlannedSessionState {
  final String name;
  final String sessionId;
  final List<PlannedExerciseState> exercises;
  PlannedSessionState({
    required this.name,
    required this.exercises,
    required this.sessionId,
  });

  factory PlannedSessionState.initial() {
    return PlannedSessionState(name: '', exercises: [], sessionId: '');
  }

  PlannedSessionState copyWith({
    String? name,
    String? sessionId,
    List<PlannedExerciseState>? exercises,
  }) {
    return PlannedSessionState(
      name: name ?? this.name,
      sessionId: sessionId ?? this.sessionId,
      exercises: exercises ?? this.exercises,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/features/workout_planning/presentation/state/planned_exercise_state.dart';

class PlannedSessionState {
  final String name;
  final List<PlannedExerciseState> exercises;
  PlannedSessionState({required this.name, required this.exercises});

  factory PlannedSessionState.initial() {
    return PlannedSessionState(name: '', exercises: []);
  }
  PlannedSessionState copyWith({
    String? name,
    List<PlannedExerciseState>? exercises,
  }) {
    return PlannedSessionState(
      name: name ?? this.name,
      exercises: exercises ?? this.exercises,
    );
  }
}

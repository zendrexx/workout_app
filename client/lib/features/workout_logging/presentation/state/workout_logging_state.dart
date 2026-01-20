// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/features/workout_logging/presentation/state/performed_exercise_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_stats_state.dart';

class WorkoutLoggingState {
  String performedSessionId;

  String name;
  DateTime? endTime;
  bool isCompleted = false;
  final List<PerformedStatsState> performedStats;
  final List<PerformedExerciseState> performedExercise;
  WorkoutLoggingState({
    required this.name,
    required this.performedSessionId,
    required this.performedStats,
    required this.performedExercise,
  });

  factory WorkoutLoggingState.initial() {
    return WorkoutLoggingState(
      name: '',
      performedSessionId: "",
      performedStats: [],
      performedExercise: [],
    );
  }

  WorkoutLoggingState copyWith({
    String? performedSessionId,
    String? name,
    DateTime? endTime,
    bool? isCompleted,
    List<PerformedStatsState>? performedStats,
    List<PerformedExerciseState>? performedExercise,
  }) {
    return WorkoutLoggingState(
      performedSessionId: performedSessionId ?? this.performedSessionId,
      name: name ?? this.name,
      performedStats: performedStats ?? this.performedStats,
      performedExercise: performedExercise ?? this.performedExercise,
    );
  }
}

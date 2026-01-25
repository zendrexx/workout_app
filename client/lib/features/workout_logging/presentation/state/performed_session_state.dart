// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/features/workout_logging/presentation/state/performed_exercise_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_stats_state.dart';

class PerformedSessionState {
  String performedSessionId;

  String name;
  DateTime endTime;
  bool isCompleted = false;
  PerformedStatsState performedStats;
  final List<PerformedExerciseState> performedExercise;
  PerformedSessionState({
    required this.name,
    required this.performedSessionId,
    required this.performedStats,
    required this.performedExercise,
    required this.endTime,
  });

  factory PerformedSessionState.initial() {
    return PerformedSessionState(
      name: '',
      performedSessionId: "",
      performedStats: PerformedStatsState(
        totalSeconds: 0,
        totalVolume: 0,
        totalSets: 0,
      ),
      performedExercise: [],
      endTime: DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  PerformedSessionState copyWith({
    String? performedSessionId,
    String? name,
    DateTime? endTime,
    bool? isCompleted,
    PerformedStatsState? performedStats,
    List<PerformedExerciseState>? performedExercise,
  }) {
    return PerformedSessionState(
      performedSessionId: performedSessionId ?? this.performedSessionId,
      name: name ?? this.name,
      performedStats: performedStats ?? this.performedStats,
      performedExercise: performedExercise ?? this.performedExercise,
      endTime: endTime ?? this.endTime,
    );
  }
}

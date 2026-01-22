// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/features/workout_logging/presentation/state/performed_exercise_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_stats_state.dart';

class WorkoutLogging {
  final String performedSessionId;

  final String name;
  final bool isCompleted = false;
  final PerformedStatsState performedStats;
  final List<PerformedExerciseState> performedExercise;
  WorkoutLogging({
    required this.name,
    required this.performedSessionId,
    required this.performedStats,
    required this.performedExercise,
  });
}

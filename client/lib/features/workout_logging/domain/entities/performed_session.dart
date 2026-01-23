// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/features/workout_logging/domain/entities/performed_exercise.dart';
import 'package:client/features/workout_logging/domain/entities/performed_stats.dart';
import 'package:client/features/workout_logging/presentation/state/performed_exercise_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_stats_state.dart';

class PerformedSession {
  final String performedSessionId;

  final String name;
  final bool isCompleted = false;
  final PerformedStats performedStats;
  final List<PerformedExercise> performedExercise;
  PerformedSession({
    required this.name,
    required this.performedSessionId,
    required this.performedStats,
    required this.performedExercise,
  });

  bool get hasExercise {
    return performedExercise.isNotEmpty;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/features/workout_logging/domain/entities/performed_exercise.dart';
import 'package:client/features/workout_logging/domain/entities/performed_stats.dart';

class PerformedSession {
  final String performedSessionId;

  final String name;
  final DateTime endTime;
  final PerformedStats performedStats;

  final String plannedSessionId;

  final List<PerformedExercise> performedExercise;
  PerformedSession({
    required this.name,
    required this.performedSessionId,
    required this.performedStats,
    required this.performedExercise,
    required this.endTime,
    required this.plannedSessionId,
  });

  bool get hasExercise {
    return performedExercise.isNotEmpty;
  }
}

import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';

class Week {
  final String weekId;

  final int weekNumber;

  final List<PlannedWorkoutSession> sessions;

  Week({
    required this.weekId,
    required this.weekNumber,
    required this.sessions,
  });
}

import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_program/domain/entities/program_session.dart';

class Week {
  final String weekId;

  final int weekNumber;

  final List<ProgramSession> sessions;

  Week({
    required this.weekId,
    required this.weekNumber,
    required this.sessions,
  });
}

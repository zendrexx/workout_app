import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';

class WeekProgramState {
  late String weekId;

  late int weekNumber;

  final Map<String, PlannedSessionState> plannedSessions;
  WeekProgramState({
    required this.weekId,
    required this.weekNumber,
    required this.plannedSessions,
  });
}

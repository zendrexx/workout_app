import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_state_mapper.dart';
import 'package:client/features/workout_program/presentation/state/program_state.dart';

ProgramState toProgramState(List<PlannedWorkoutSession> sessions) {
  final sessionMap = {for (final s in sessions) s.sessionId: toStateSession(s)};
  return ProgramState(
    plannedSessions: sessionMap,

    programName: "",
    programSessionIds: [],
    programSessionId: "",
  );
}

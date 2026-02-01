import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_state_mapper.dart';
import 'package:client/features/workout_program/presentation/state/program_state.dart';

ProgramState toProgramState(List<PlannedWorkoutSession> session) {
  return ProgramState(
    plannedSessions: session
        .map<PlannedSessionState>((s) => toStateSession(s))
        .toList(),
    programName: "",
    programSessions: [],
    programSessionId: "",
  );
}

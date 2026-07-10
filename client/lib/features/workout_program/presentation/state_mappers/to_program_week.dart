import 'package:client/features/workout_planning/presentation/statemappers/to_state_mapper.dart';
import 'package:client/features/workout_program/domain/entities/program_session.dart';
import 'package:client/features/workout_program/domain/entities/week.dart';
import 'package:client/features/workout_program/presentation/state/program_session_state.dart';
import 'package:client/features/workout_program/presentation/state/week_program_state.dart';

ProgramSessionState toProgramSessionState(ProgramSession session) {
  return ProgramSessionState(
    sessionId: session.sessionId,
    createdAt: session.createdAt,
    dayNumber: session.dayNumber,
    sessionName: session.name,
    exercises: session.exercises.map(toStateExercise).toList(),
  );
}

WeekState toWeekState(Week week) {
  return WeekState(
    weekId: week.weekId,
    weekNumber: week.weekNumber,
    session: week.sessions.map(toProgramSessionState).toList(),
  );
}

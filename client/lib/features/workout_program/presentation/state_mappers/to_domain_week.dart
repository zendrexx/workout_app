import 'package:client/features/workout_planning/presentation/statemappers/to_domain_mapper.dart';
import 'package:client/features/workout_program/domain/entities/program_session.dart';
import 'package:client/features/workout_program/domain/entities/week.dart';
import 'package:client/features/workout_program/presentation/state/program_session_state.dart';
import 'package:client/features/workout_program/presentation/state/week_program_state.dart';

ProgramSession toDomainProgramSession(ProgramSessionState s) {
  return ProgramSession(
    sessionId: s.sessionId,
    createdAt: s.createdAt,
    dayNumber: s.dayNumber,
    name: s.sessionName,
    exercises: s.exercises.map(mapExercise).toList(),
  );
}

Week toDomainWeek(WeekState s) {
  return Week(
    weekId: s.weekId,
    weekNumber: s.weekNumber,
    sessions: s.session.map(toDomainProgramSession).toList(),
  );
}

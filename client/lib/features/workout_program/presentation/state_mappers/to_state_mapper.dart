import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/presentation/state/program_state.dart';

ProgramState toStateSession(Program s) {
  return ProgramState(
    plannedSessions: {},
    programName: s.name,
    programSessionId: s.programId,
    programSessionIds: s.sessionIds,
  );
}

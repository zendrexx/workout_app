import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/presentation/state/program_state.dart';

Program mapProgram(ProgramState s) {
  return Program(
    name: s.programName,
    programId: '',
    sessionIds: s.plannedSessions.map((e) => e.sessionId).toList(),
  );
}

import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/presentation/state/program_state.dart';

ProgramState toProgramState(Program program) {
  return ProgramState(
    programName: program.name,
    // programSessionIds: program.sessionIds,
    programId: program.programId,
  );
}

import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/presentation/state/program_state.dart';
import 'package:client/features/workout_program/presentation/state_mappers/to_program_week.dart';

ProgramState toProgramState(Program program) {
  return ProgramState(
    programName: program.name,
    weekState: program.week.map((w) => toWeekState(w)).toList(),
    programId: program.programId,
  );
}

import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/presentation/state/program_state.dart';
import 'package:client/features/workout_program/presentation/state_mappers/to_domain_week.dart';

Program mapProgram(ProgramState s) {
  return Program(
    programId: s.programId,
    name: s.programName,
    week: s.weekState.map(toDomainWeek).toList(),
  );
}

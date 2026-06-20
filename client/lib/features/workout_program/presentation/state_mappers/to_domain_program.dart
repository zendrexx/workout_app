import 'package:client/features/workout_program/data/mappers/isar_to_domain_program.dart';
import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/presentation/state/program_state.dart';
import 'package:client/features/workout_program/presentation/state_mappers/to_domain_week.dart';

Program mapProgram(ProgramState s) {
  return Program(
    name: s.programName,
    programId: s.programId,
    week: s.weekState.map((s) => toDomainWeek(s)).toList(),
    //sessionIds: s.programSessionIds,
  );
}

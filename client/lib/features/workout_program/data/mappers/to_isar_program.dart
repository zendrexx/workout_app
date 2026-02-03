import 'package:client/core/utils/id_generator.dart';
import 'package:client/features/workout_program/data/models/program_isar.dart';
import 'package:client/features/workout_program/domain/entities/program.dart';

ProgramIsar toIsarProgram(Program p) {
  return ProgramIsar(
    programId: IdGenerator().getId(),
    name: p.name,
    sessionIds: p.sessionIds,
  );
}

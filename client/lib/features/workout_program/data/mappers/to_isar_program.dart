import 'package:client/core/utils/id_generator.dart';
import 'package:client/features/workout_program/data/models/program_isar.dart';
import 'package:client/features/workout_program/domain/entities/program.dart';

ProgramIsar toIsarProgram(Program p) {
  return ProgramIsar(
    programId: p.programId.isEmpty ? IdGenerator().getId() : p.programId,
    name: p.name,
    sessionIds: p.sessionIds,
    createdAt: DateTime.now(),
  );
}

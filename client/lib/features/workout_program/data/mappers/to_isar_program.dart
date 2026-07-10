import 'package:client/core/utils/id_generator.dart';
import 'package:client/features/workout_program/data/mappers/domain_to_isar_program_mapper.dart';
import 'package:client/features/workout_program/data/models/program_isar.dart';
import 'package:client/features/workout_program/domain/entities/program.dart';

ProgramIsar toIsarProgram(Program p) {
  return ProgramIsar(
    programId: p.programId.isEmpty ? IdGenerator().getId() : p.programId,
    name: p.name,
  )..weeks = p.week.map(toIsarWeek).toList();
}

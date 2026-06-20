import 'package:client/features/workout_program/data/mappers/week_to_domain.dart';
import 'package:client/features/workout_program/data/models/program_isar.dart';
import 'package:client/features/workout_program/domain/entities/program.dart';

Program toDomainProgram(ProgramIsar s) {
  final program = Program(
    name: s.name,
    programId: s.programId,
    week: s.weeks.map((week) => toWeek(week)).toList(),
    //sessionIds: s.sessionIds.toList(),
  );

  return program;
}

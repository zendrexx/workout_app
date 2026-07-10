import 'package:client/features/workout_program/data/datasources/program_session_isar_datasource.dart';
import 'package:client/features/workout_program/data/mappers/domain_to_isar_program_mapper.dart';
import 'package:client/features/workout_program/data/mappers/isar_to_domain_program.dart';
import 'package:client/features/workout_program/data/mappers/to_isar_program.dart';
import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/domain/entities/week.dart';
import 'package:client/features/workout_program/domain/repositories/program_repository.dart';

class ProgramRepositoryImpl implements ProgramRepository {
  final ProgramSessionIsarDatasource datasource;
  ProgramRepositoryImpl(this.datasource);

  @override
  Future<void> addProgram(Program plannedProgram) {
    final program = toIsarProgram(plannedProgram);

    return datasource.addProgram(program);
  }

  @override
  Stream<List<Program>> watchAllPrograms() {
    return datasource.watchAll().map(
      (isarSessions) => isarSessions.map(toDomainProgram).toList(),
    );
  }

  @override
  Future<void> deleteProgram(String programId) async {
    return await datasource.deleteprogram(programId);
  }

  @override
  Future<Program?> getProgramById(String programId) async {
    final isarSession = await datasource.getProgramById(programId);
    if (isarSession == null) return null;
    return toDomainProgram(isarSession);
  }

  @override
  Future<void> addWeek(String programId, Week week) async {
    final program = await datasource.getProgramById(programId);

    if (program == null) {
      throw Exception('Program not found');
    }

    program.weeks.add(toIsarWeek(week));

    await datasource.addProgram(program);
  }

  @override
  Future<void> updateWeek(String programId, Week week) async {
    final program = await datasource.getProgramById(programId);

    if (program == null) {
      throw Exception('Program not found');
    }

    final index = program.weeks.indexWhere((w) => w.weekId == week.weekId);

    if (index == -1) {
      throw Exception('Week not found');
    }

    program.weeks[index] = toIsarWeek(week);

    await datasource.addProgram(program);
  }

  @override
  Future<void> deleteWeek(String programId, String weekId) async {
    final program = await datasource.getProgramById(programId);

    if (program == null) {
      throw Exception('Program not found');
    }

    program.weeks.removeWhere((w) => w.weekId == weekId);

    await datasource.addProgram(program);
  }
}

import 'package:client/features/workout_program/data/datasources/program_session_isar_datasource.dart';
import 'package:client/features/workout_program/data/mappers/isar_to_domain_program.dart';
import 'package:client/features/workout_program/data/mappers/to_isar_program.dart';
import 'package:client/features/workout_program/data/models/program_isar.dart';
import 'package:client/features/workout_program/domain/entities/program.dart';
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
  Stream<List<Program>> watchAllSessions() {
    return datasource.watchAll().map(
      (isarSessions) => isarSessions.map(toDomainProgram).toList(),
    );
  }

  @override
  Future<void> deleteSession(String sessionId) async {
    return await datasource.deleteSession(sessionId);
  }

  @override
  Future<ProgramIsar?> duplicateSession(String sessionId) async {
    return await datasource.duplicateSession(sessionId);
  }

  @override
  Future<Program?> getProgramById(String programId) async {
    final isarSession = await datasource.getProgramById(programId);
    if (isarSession == null) return null;
    return toDomainProgram(isarSession);
  }
}

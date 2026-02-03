import 'package:client/features/workout_planning/data/mappers/domain_to_isar_session_mapper.dart';
import 'package:client/features/workout_program/data/datasources/program_session_isar_datasource.dart';
import 'package:client/features/workout_program/data/mappers/to_isar_program.dart';
import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/domain/repositories/program_repository.dart';

class ProgramRepositoryImpl implements ProgramRepository {
  final ProgramSessionIsarDatasource datasource;
  ProgramRepositoryImpl(this.datasource);

  @override
  Future<void> addProgram(Program plannedSession) {
    final program = toIsarProgram(plannedSession);

    return datasource.addProgram(program);
  }
}

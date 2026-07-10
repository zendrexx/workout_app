import 'package:client/features/workout_program/data/datasources/active_program_isar_datasource.dart';
import 'package:client/features/workout_program/data/mappers/active_program_mapper.dart';
import 'package:client/features/workout_program/domain/entities/active_program.dart';
import 'package:client/features/workout_program/domain/repositories/active_program_repository.dart';

class ActiveProgramRepositoryImpl implements ActiveProgramRepository {
  final ActiveProgramIsarDatasource datasource;
  ActiveProgramRepositoryImpl(this.datasource);

  @override
  Future<ActiveProgram?> getActiveProgram() async {
    final isar = await datasource.getActive();
    if (isar == null) return null;
    return toDomainActiveProgram(isar);
  }

  @override
  Future<void> saveActiveProgram(ActiveProgram active) async {
    await datasource.save(toIsarActiveProgram(active));
  }

  @override
  Future<void> clearActiveProgram() async {
    await datasource.clear();
  }
}

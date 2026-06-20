import 'package:client/features/workout_program/data/datasources/program_session_isar_datasource.dart';
import 'package:client/features/workout_program/data/mappers/isar_to_domain_program.dart';
import 'package:client/features/workout_program/data/mappers/to_isar_program.dart';
import 'package:client/features/workout_program/data/models/program_isar.dart';
import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/domain/entities/week.dart';
import 'package:client/features/workout_program/domain/repositories/program_repository.dart';
import 'package:client/features/workout_program/domain/usecases/watch_all_program.dart';

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
    // final program = await datasource.getProgramById(programId);

    // if (program == null) {
    //   throw Exception('Program not found');
    // }

    // final weekIsar = toIsarWeek(week);

    // await weekIsar.save();

    // program.weeks.add(weekIsar);

    // await datasource.saveProgram(program);
  }

  @override
  Future<void> updateWeek(String programId, Week week) async {
    // final program = await datasource.getProgramById(programId);

    // if (program == null) {
    //   throw Exception('Program not found');
    // }

    // await program.weeks.load();

    // final index = program.weeks.indexWhere((w) => w.weekId == week.weekId);

    // if (index == -1) {
    //   throw Exception('Week not found');
    // }

    // final updatedWeek = toIsarWeek(week);

    // updatedWeek.id = program.weeks[index].id;

    // await datasource.isar.writeTxn(() async {
    //   await datasource.isar.weekProgramIsars.put(updatedWeek);

    //   program.weeks[index] = updatedWeek;

    //   await program.weeks.save();
    // });
  }

  @override
  Future<void> deleteWeek(String programId, String weekId) async {
    //   final program = await datasource.getProgramById(programId);

    //   if (program == null) {
    //     throw Exception('Program not found');
    //   }

    //   await program.weeks.load();

    //   final week = program.weeks.firstWhere((w) => w.weekId == weekId);

    //   await datasource.isar.writeTxn(() async {
    //     program.weeks.remove(week);

    //     await program.weeks.save();

    //     await datasource.isar.weekProgramIsars.delete(week.id);
    //   });
    // }
  }
}

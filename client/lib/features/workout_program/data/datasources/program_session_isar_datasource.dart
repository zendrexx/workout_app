import 'package:client/core/utils/id_generator.dart';
import 'package:client/features/workout_program/data/models/program_isar.dart';
import 'package:isar/isar.dart';

class ProgramSessionIsarDatasource {
  final Isar isar;
  ProgramSessionIsarDatasource(this.isar);

  Future<void> addProgram(ProgramIsar program) async {
    final db = isar;

    final existing = await db.programIsars.getByProgramId(program.programId);

    await db.writeTxn(() async {
      if (existing != null) {
        program.id = existing.id;
      }
      await db.programIsars.put(program);
    });
  }

  Stream<List<ProgramIsar>> watchAll() {
    return isar.programIsars.where().watch(fireImmediately: true);
  }

  Future<void> deleteprogram(String programId) async {
    await isar.writeTxn(() async {
      final program = await isar.programIsars.getByProgramId(programId);
      if (program != null) {
        await isar.programIsars.delete(program.id);
      }
      // await isar.plannedSessionIsars.clear();
    });
  }

  Future<ProgramIsar?> getProgramById(String programId) async {
    final program = await isar.programIsars.getByProgramId(programId);
    if (program == null) return null;

    return program;
  }
}

import 'package:client/features/workout_program/data/models/program_isar.dart';
import 'package:isar/isar.dart';

class ProgramSessionIsarDatasource {
  final Isar isar;
  ProgramSessionIsarDatasource(this.isar);

  Future<void> addProgram(ProgramIsar program) async {
    final db = isar;

    await db.writeTxn(() async {
      await db.programIsars.put(program);
    });
  }
}

import 'package:client/core/utils/id_generator.dart';
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

  Stream<List<ProgramIsar>> watchAll() {
    return isar.programIsars.where().watch(fireImmediately: true);
  }

  Future<void> deleteSession(String sessionId) async {
    await isar.writeTxn(() async {
      final session = await isar.programIsars.getByProgramId(sessionId);
      if (session != null) {
        await isar.programIsars.delete(session.id);
      }
      // await isar.plannedSessionIsars.clear();
    });
  }

  Future<ProgramIsar?> duplicateSession(String sessionId) async {
    final original = await isar.programIsars.getByProgramId(sessionId);
    if (original == null) return null;

    late ProgramIsar newProgram;

    await isar.writeTxn(() async {
      newProgram = ProgramIsar(
        name: "Copy of ${original.name}",
        createdAt: DateTime.now(),
        programId: IdGenerator().getId().toString(),
        sessionIds: original.sessionIds,
      );

      await isar.programIsars.put(newProgram);
    });

    return newProgram;
  }
}

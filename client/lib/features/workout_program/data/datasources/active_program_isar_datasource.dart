import 'package:client/features/workout_program/data/models/active_program_isar.dart';
import 'package:isar/isar.dart';

/// Only one program is "active" at a time, so this stores/reads a single row.
class ActiveProgramIsarDatasource {
  final Isar isar;
  ActiveProgramIsarDatasource(this.isar);

  Future<ActiveProgramIsar?> getActive() async {
    return isar.activeProgramIsars.where().findFirst();
  }

  Future<void> save(ActiveProgramIsar active) async {
    final existing = await isar.activeProgramIsars.getByActiveProgramId(
      active.activeProgramId,
    );

    await isar.writeTxn(() async {
      if (existing != null) {
        active.id = existing.id;
      }
      await isar.activeProgramIsars.put(active);
    });
  }

  Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.activeProgramIsars.clear();
    });
  }
}

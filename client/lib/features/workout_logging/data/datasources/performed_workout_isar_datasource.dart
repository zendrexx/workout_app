import 'package:client/features/workout_logging/data/mappers/domain_to_isar_performed_session_mapper.dart';
import 'package:client/features/workout_logging/data/models/performed_exercise_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_session_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_sets_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_stats_isar.dart';
import 'package:client/features/workout_logging/domain/entities/performed_session.dart';
import 'package:isar/isar.dart';

class PerformedWorkoutIsarDatasource {
  final Isar isar;
  PerformedWorkoutIsarDatasource(this.isar);

  Future<void> addPerformedSession(PerformedSession session) async {
    final sessionIsar = toPerformedSessionIsar(session);

    await isar.writeTxn(() async {
      await isar.performedSessionIsars.put(sessionIsar);
    });
  }

  Stream<List<PerformedSessionIsar>> watchAll() {
    return isar.performedSessionIsars.where().watch(fireImmediately: true);
  }
}

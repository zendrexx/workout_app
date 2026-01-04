import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';
import 'package:client/data/data_source/planned_workout_data_source.dart';
import 'package:client/data/models/exercise.dart';
import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/core/database/database_service.dart';
import 'package:isar/isar.dart';

class PlannedSessionRepo implements PlannedSessionAbstract {
  final PlannedWorkoutDataSource local;
  PlannedSessionRepo(this.local);

  @override
  Future<List<PlannedSession>> getAllPlannedSession() {
    return local.getAllPlannedSession();
  }

  @override
  Future<PlannedSession?> getSessionById(int id) {
    return local.getSessionById(id);
  }

  @override
  Future<void> addSession(PlannedSession plannedSession) {
    return local.addSession(plannedSession);
  }

  @override
  Future<void> deleteSession(int id) {
    return local.deleteSession(id);
  }

  @override
  Future<PlannedSession?> duplicateSession(int id) {
    return local.duplicateSession(id);
  }
}

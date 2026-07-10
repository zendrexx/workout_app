import 'package:client/features/workout_program/domain/entities/active_program.dart';

abstract class ActiveProgramRepository {
  Future<ActiveProgram?> getActiveProgram();
  Future<void> saveActiveProgram(ActiveProgram active);

  /// Removes the current active program (used when replacing it).
  Future<void> clearActiveProgram();
}

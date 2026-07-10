import 'package:client/features/workout_program/domain/entities/active_program.dart';
import 'package:client/features/workout_program/domain/repositories/active_program_repository.dart';

/// Resets the active program back to its first week/day, keeping the same
/// program template so the user can run through it again from the start.
class RestartActiveProgram {
  final ActiveProgramRepository repo;
  RestartActiveProgram(this.repo);

  Future<void> call(ActiveProgram active) {
    final restarted = active.copyWith(
      currentWeek: 1,
      currentDay: 1,
      isCompleted: false,
      startedAt: DateTime.now(),
    );
    return repo.saveActiveProgram(restarted);
  }
}

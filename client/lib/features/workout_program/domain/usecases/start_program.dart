import 'package:client/features/workout_program/domain/entities/active_program.dart';
import 'package:client/features/workout_program/domain/repositories/active_program_repository.dart';

/// Makes [templateProgramId] the user's active program, starting at
/// Week 1 / Day 1. Replaces the current active program if one exists
/// (only one program can be active at a time).
class StartProgram {
  final ActiveProgramRepository repo;
  StartProgram(this.repo);

  Future<void> call(String templateProgramId) async {
    // Reuse the existing active row's id so this stays a single-row swap
    // instead of accumulating stale active programs.
    final current = await repo.getActiveProgram();

    final active = ActiveProgram(
      activeProgramId: current?.activeProgramId ?? 'active_default',
      templateProgramId: templateProgramId,
      currentWeek: 1,
      currentDay: 1,
      startedAt: DateTime.now(),
    );

    await repo.saveActiveProgram(active);
  }
}

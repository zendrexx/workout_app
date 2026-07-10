import 'package:client/features/workout_program/domain/repositories/active_program_repository.dart';

/// Removes the active program so the user can start/replace it with another.
class ClearActiveProgram {
  final ActiveProgramRepository repo;
  ClearActiveProgram(this.repo);

  Future<void> call() {
    return repo.clearActiveProgram();
  }
}

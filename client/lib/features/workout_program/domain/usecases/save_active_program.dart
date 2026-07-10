import 'package:client/features/workout_program/domain/entities/active_program.dart';
import 'package:client/features/workout_program/domain/repositories/active_program_repository.dart';

class SaveActiveProgram {
  final ActiveProgramRepository repo;
  SaveActiveProgram(this.repo);

  Future<void> call(ActiveProgram active) {
    return repo.saveActiveProgram(active);
  }
}

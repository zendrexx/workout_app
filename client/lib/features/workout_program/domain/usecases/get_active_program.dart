import 'package:client/features/workout_program/domain/entities/active_program.dart';
import 'package:client/features/workout_program/domain/repositories/active_program_repository.dart';

class GetActiveProgram {
  final ActiveProgramRepository repo;
  GetActiveProgram(this.repo);

  Future<ActiveProgram?> call() {
    return repo.getActiveProgram();
  }
}

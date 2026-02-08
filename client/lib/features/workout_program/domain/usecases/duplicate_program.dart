import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';
import 'package:client/features/workout_program/domain/repositories/program_repository.dart';

class DuplicateProgram {
  final ProgramRepository repo;

  DuplicateProgram(this.repo);

  Future<void> call(String sessionId) {
    return repo.duplicateSession(sessionId);
  }
}

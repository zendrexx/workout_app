import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/domain/repositories/program_repository.dart';

class GetProgramById {
  final ProgramRepository repo;

  GetProgramById(this.repo);

  Future<Program> call(String programId) async {
    final program = await repo.getProgramById(programId);

    if (program == null) {
      throw Exception('Workout Program not found');
    }

    return program;
  }
}

import 'package:client/features/workout_planning/domain/failures/planned_session_failure.dart';
import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';
import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/domain/failures/program_failure.dart';
import 'package:client/features/workout_program/domain/repositories/program_repository.dart';
import 'package:dartz/dartz.dart';

class AddProgram {
  final ProgramRepository repo;

  AddProgram(this.repo);

  Future<Either<ProgramFailure, void>> call(Program program) async {
    if (!program.hasName) {
      return Left(EmptyProgramNameFailure());
    }
    if (!program.hasSessionIds) {
      return Left(EmptyProgramSessionFailure());
    }

    await repo.addProgram(program);
    return const Right(null);
  }
}

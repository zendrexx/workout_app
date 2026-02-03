import 'package:client/features/workout_program/domain/failures/program_failure.dart';

String mapProgramFailure(ProgramFailure failure) {
  return switch (failure) {
    EmptyProgramNameFailure() => 'Session name is required',
    EmptyProgramSessionFailure() => 'Add at least one exercise',
  };
}

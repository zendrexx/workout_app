import 'package:client/features/workout_program/domain/entities/program.dart';

abstract class ProgramRepository {
  Future<void> addProgram(Program plannedSession);
  Stream<List<Program>> watchAllSessions();
}

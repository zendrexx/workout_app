import 'package:client/features/workout_program/data/models/program_isar.dart';
import 'package:client/features/workout_program/domain/entities/program.dart';

abstract class ProgramRepository {
  Future<void> addProgram(Program plannedSession);
  Stream<List<Program>> watchAllSessions();
  Future<void> deleteSession(String sessionId);
  Future<ProgramIsar?> duplicateSession(String sessionId);
  Future<Program?> getProgramById(String programId);
}

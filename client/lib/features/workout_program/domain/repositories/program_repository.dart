import 'package:client/features/workout_program/data/models/program_isar.dart';
import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/domain/entities/week.dart';

abstract class ProgramRepository {
  Future<void> addProgram(Program plannedSession);
  Stream<List<Program>> watchAllPrograms();
  Future<void> deleteProgram(String programId);
  Future<Program?> getProgramById(String programId);

  Future<void> addWeek(String programId, Week week);

  Future<void> updateWeek(String programId, Week week);

  Future<void> deleteWeek(String programId, String weekId);
}

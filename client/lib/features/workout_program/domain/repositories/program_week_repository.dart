import 'package:client/features/workout_program/domain/entities/week.dart';

abstract class ProgramWeekRepository {
  Future<void> addWeek(Week plannedSession);
  Stream<List<Week>> watchAllWeek();
  Future<void> deleteWeek(String weekId);
  Future<Week?> getWeekById(String weekId);
}

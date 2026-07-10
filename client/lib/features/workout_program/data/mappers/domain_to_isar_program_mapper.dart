import 'package:client/features/workout_planning/data/mappers/domain_to_isar_session_mapper.dart';
import 'package:client/features/workout_program/data/models/program_session_isar.dart';
import 'package:client/features/workout_program/data/models/program_week_isar.dart';
import 'package:client/features/workout_program/domain/entities/program_session.dart';
import 'package:client/features/workout_program/domain/entities/week.dart';

ProgramSessionIsar toIsarProgramSession(ProgramSession s) {
  return ProgramSessionIsar()
    ..sessionId = s.sessionId
    ..name = s.name
    ..createdAt = s.createdAt
    ..dayNumber = s.dayNumber
    ..exercises = s.exercises.map(toIsarExercise).toList();
}

ProgramWeekIsar toIsarWeek(Week w) {
  return ProgramWeekIsar(weekId: w.weekId, weekNumber: w.weekNumber)
    ..sessions = w.sessions.map(toIsarProgramSession).toList();
}

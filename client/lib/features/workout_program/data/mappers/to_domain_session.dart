import 'package:client/features/workout_planning/data/mappers/isar_to_domain_session_mapper.dart';
import 'package:client/features/workout_program/data/models/program_session_isar.dart';
import 'package:client/features/workout_program/domain/entities/program_session.dart';

ProgramSession toProgramSession(ProgramSessionIsar s) {
  return ProgramSession(
    sessionId: s.sessionId,
    createdAt: s.createdAt ?? DateTime.now(),
    dayNumber: s.dayNumber,
    name: s.name,
    exercises: s.exercises.map((e) => toDomainPlannedExercise(e)).toList(),
  );
}

import 'package:client/features/workout_program/data/mappers/to_domain_session.dart';
import 'package:client/features/workout_program/data/models/program_week_isar.dart';
import 'package:client/features/workout_program/domain/entities/week.dart';

Week toWeek(ProgramWeekIsar s) {
  return Week(
    weekId: s.weekId,
    weekNumber: s.weekNumber,
    sessions: s.sessions.map((e) => toProgramSession(e)).toList(),
  );
}

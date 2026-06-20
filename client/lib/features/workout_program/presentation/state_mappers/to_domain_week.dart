import 'package:client/features/workout_planning/data/mappers/isar_to_domain_session_mapper.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_domain_mapper.dart';
import 'package:client/features/workout_program/domain/entities/week.dart';
import 'package:client/features/workout_program/presentation/state/week_program_state.dart';

Week toDomainWeek(WeekState s) {
  return Week(
    weekNumber: s.weekNumber,
    weekId: s.weekId,
    sessions: s.plannedSessions.map((s) => mapSession(s)).toList(),
  );
}

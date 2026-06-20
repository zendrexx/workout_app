import 'package:client/features/workout_planning/presentation/statemappers/to_state_mapper.dart';
import 'package:client/features/workout_program/domain/entities/week.dart';
import 'package:client/features/workout_program/presentation/state/week_program_state.dart';

WeekState toWeekState(Week week) {
  return WeekState(
    weekId: week.weekId,
    weekNumber: week.weekNumber,
    sessionIds: week.sessionIds,
  );
}

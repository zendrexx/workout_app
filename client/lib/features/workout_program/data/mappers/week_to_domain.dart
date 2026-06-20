import 'package:client/features/workout_planning/data/mappers/isar_to_domain_session_mapper.dart';
import 'package:client/features/workout_program/data/models/program_week_isar.dart';
import 'package:client/features/workout_program/domain/entities/week.dart';

Week toWeek(ProgramWeekIsar s) {
  return Week(
    weekId: s.weekId,
    weekNumber: s.weekNumber,
    sessionIds: s
        .sessionIds, // Assuming you have a way to map PlannedWorkoutSessionIsar to PlannedWorkoutSession
  );
}

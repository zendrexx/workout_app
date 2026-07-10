import 'package:client/features/workout_program/data/models/active_program_isar.dart';
import 'package:client/features/workout_program/domain/entities/active_program.dart';

ActiveProgram toDomainActiveProgram(ActiveProgramIsar s) {
  return ActiveProgram(
    activeProgramId: s.activeProgramId,
    templateProgramId: s.templateProgramId,
    currentWeek: s.currentWeek,
    currentDay: s.currentDay,
    startedAt: s.startedAt,
    isCompleted: s.isCompleted,
  );
}

ActiveProgramIsar toIsarActiveProgram(ActiveProgram a) {
  return ActiveProgramIsar(
    activeProgramId: a.activeProgramId,
    templateProgramId: a.templateProgramId,
    currentWeek: a.currentWeek,
    currentDay: a.currentDay,
    startedAt: a.startedAt,
    isCompleted: a.isCompleted,
  );
}

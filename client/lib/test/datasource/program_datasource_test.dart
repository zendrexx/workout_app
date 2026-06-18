import 'package:client/features/workout_planning/data/models/exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';
import 'package:client/features/workout_program/data/datasources/program_session_isar_datasource.dart';
import 'package:client/features/workout_program/data/models/program_isar.dart';
import 'package:client/features/workout_program/data/models/program_week_isar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';

void main() {
  late Isar isar;
  late ProgramSessionIsarDatasource datasource;

  setUp(() async {
    isar = await Isar.open(
      [
        ProgramIsarSchema,
        ProgramWeekIsarSchema,
        PlannedSessionIsarSchema,
        PlannedExerciseIsarSchema,
        PlannedSetIsarSchema,
        ExerciseIsarSchema,
      ],
      directory: './testdb',
      name: 'test',
    );

    datasource = ProgramSessionIsarDatasource(isar);
  });

  tearDown(() async {
    await isar.close(deleteFromDisk: true);
  });

  test('should save a program', () async {
    final program = ProgramIsar(
      name: "Candito 7 Weeks",
      programId: 'candito7weeks',
    );

    await datasource.addProgram(program);

    final saved = await isar.programIsars.getByProgramId('candito7weeks');

    expect(saved, isNotNull);
    expect(saved!.name, 'Candito 7 Weeks');
  });
}

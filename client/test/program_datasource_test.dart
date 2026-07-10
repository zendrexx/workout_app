import 'dart:ffi';
import 'dart:io';

import 'package:client/features/workout_planning/data/models/exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_program/data/datasources/program_session_isar_datasource.dart';
import 'package:client/features/workout_program/data/models/program_isar.dart';
import 'package:client/features/workout_program/data/models/program_session_isar.dart';
import 'package:client/features/workout_program/data/models/program_week_isar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Isar? isar;
  late ProgramSessionIsarDatasource datasource;
  late Directory tempDir;

  setUp(() async {
    final dllPath =
        '${Directory.current.path}\\build\\windows\\x64\\runner\\Debug\\isar.dll';

    Isar.initializeIsarCore(libraries: {Abi.windowsX64: dllPath});

    tempDir = await Directory.systemTemp.createTemp('isar_test');

    isar = await Isar.open(
      [ProgramIsarSchema, PlannedSessionIsarSchema, ExerciseIsarSchema],
      directory: tempDir.path,
      name: 'test',
    );

    datasource = ProgramSessionIsarDatasource(isar!);
  });

  tearDown(() async {
    await isar?.close(deleteFromDisk: true);

    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  test('should save a program with its weeks and sessions', () async {
    final program = ProgramIsar(
      name: 'Candito 7 Weeks',
      programId: 'candito7weeks',
    );

    final week1 = ProgramWeekIsar(weekNumber: 1, weekId: 'week1');
    week1.sessions = [
      ProgramSessionIsar()
        ..sessionId = 'session1'
        ..name = 'Squat Day'
        ..dayNumber = 1,
    ];
    program.weeks.addAll([week1]);
    await datasource.addProgram(program);

    final saved = await isar!.programIsars.getByProgramId('candito7weeks');

    expect(saved, isNotNull);
    expect(saved!.name, 'Candito 7 Weeks');
    expect(saved.weeks, hasLength(1));
    expect(saved.weeks.first.weekId, 'week1');
    expect(saved.weeks.first.weekNumber, 1);
    expect(saved.weeks.first.sessions, hasLength(1));
    expect(saved.weeks.first.sessions.first.sessionId, 'session1');
    expect(saved.weeks.first.sessions.first.dayNumber, 1);
  });
}

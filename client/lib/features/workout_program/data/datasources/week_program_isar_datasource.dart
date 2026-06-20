// import 'package:client/features/workout_program/data/models/program_week_isar.dart';
// import 'package:isar/isar.dart';

// class WeekProgramIsarDatasource {
//   final Isar isar;
//   WeekProgramIsarDatasource(this.isar);

//   Future<void> addProgram(ProgramWeekIsar week) async {
//     final db = isar;

//     final existing = await db.programWeekIsars.getByWeekId(week.weekId);

//     await db.writeTxn(() async {
//       if (existing != null) {
//         week.id = existing.id;
//       }
//       await db.programWeekIsars.put(week);
//     });
//   }

//   Stream<List<ProgramWeekIsar>> watchAll() {
//     return isar.programWeekIsars.where().watch(fireImmediately: true);
//   }

//   Future<void> deleteprogram(String programId) async {
//     await isar.writeTxn(() async {
//       final program = await isar.programWeekIsars.getByWeekId(programId);
//       if (program != null) {
//         await isar.programWeekIsars.delete(program.id);
//       }
//       // await isar.plannedSessionIsars.clear();
//     });
//   }

//   Future<ProgramWeekIsar?> getProgramById(String programId) async {
//     final program = await isar.programWeekIsars.getByWeekId(programId);
//     if (program == null) return null;

//     return program;
//   }
// }

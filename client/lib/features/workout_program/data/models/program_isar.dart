import 'package:client/features/workout_program/data/models/program_week_isar.dart';
import 'package:isar/isar.dart';

part 'program_isar.g.dart';

@Collection()
class ProgramIsar {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String programId;

  late String name;

  //DateTime createdAt;
  List<ProgramWeekIsar> weeks = [];
  // final weeks = IsarLinks<ProgramWeekIsar>();

  ProgramIsar({
    required this.programId,
    required this.name,
    // required this.createdAt,
  });
}

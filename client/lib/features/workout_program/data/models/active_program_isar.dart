import 'package:isar/isar.dart';

part 'active_program_isar.g.dart';

@Collection()
class ActiveProgramIsar {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String activeProgramId;

  /// References ProgramIsar.programId
  late String templateProgramId;

  late int currentWeek;

  late int currentDay;

  late DateTime startedAt;

  bool isCompleted = false;

  ActiveProgramIsar({
    required this.activeProgramId,
    required this.templateProgramId,
    required this.currentWeek,
    required this.currentDay,
    required this.startedAt,
    this.isCompleted = false,
  });
}

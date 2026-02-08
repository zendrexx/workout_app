import 'package:isar/isar.dart';

part 'program_isar.g.dart';

@Collection()
class ProgramIsar {
  Id id = Isar.autoIncrement;
  @Index(unique: true)
  late String programId;
  DateTime createdAt;

  late String name;
  List<String> sessionIds;
  ProgramIsar({
    required this.programId,
    required this.name,
    required this.sessionIds,
    required this.createdAt,
  });
}

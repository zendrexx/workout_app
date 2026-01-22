import 'package:isar/isar.dart';

part 'performed_sets_isar.g.dart';

@collection
class PerformedSetsIsar {
  Id id = Isar.autoIncrement;
  double? estWeight;
  double? actWeight;
  String? estRep;

  int? actualRep;
  bool isCompleted;

  PerformedSetsIsar({
    this.estWeight,
    this.actWeight,
    this.estRep,
    this.actualRep,
    this.isCompleted = false,
  });
}

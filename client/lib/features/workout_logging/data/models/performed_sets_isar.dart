import 'package:isar/isar.dart';

part 'performed_sets_isar.g.dart';

@collection
class PerformedSetsIsar {
  Id id = Isar.autoIncrement;
  double? estWeight;
  double? actWeight;
  //double? prevWeight;
  String? estRep;

  int? actualRep;
  bool isCompleted;
  @Index(unique: true)
  String setId = "";
  PerformedSetsIsar({
    this.estWeight,
    this.actWeight,
    //this.prevWeight,
    this.estRep,
    this.actualRep,
    this.isCompleted = false,
  });
}

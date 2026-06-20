import 'package:isar/isar.dart';

part 'performed_sets_isar.g.dart';

@embedded
class PerformedSetsIsar {
  double? estWeight;
  String? estRep;

  double? actWeight;
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

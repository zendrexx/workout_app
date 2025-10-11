import 'package:isar/isar.dart';
import 'exercise.dart';

part 'planned_set.g.dart';

@collection
class PlannedSet {
  Id id = Isar.autoIncrement;

  double? estWeight;
  int? minRep;
  int? maxRep;

  final exercise = IsarLink<Exercise>();

  PlannedSet({this.estWeight, this.minRep, this.maxRep});
}

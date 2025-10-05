import 'package:isar/isar.dart';

part 'workout_sets.g.dart';

@Collection()
class Workoutsets {
  Id id = Isar.autoIncrement;
  double? estWeight;
  double actWeight;
  int? minRep;
  int? maxRep;
  int? actualRep;
  bool isCompleted;

  Workoutsets({
    required this.id,
    this.estWeight,
    required this.actWeight,
    this.minRep,
    this.maxRep,
    required this.actualRep,
    this.isCompleted = false,
  });
}

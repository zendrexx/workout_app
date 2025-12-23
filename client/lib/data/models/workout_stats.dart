import 'package:isar/isar.dart';

part 'workout_stats.g.dart';

@collection
class WorkoutStats {
  Id id = Isar.autoIncrement;
  int? hours;
  int? minutes;
  int? seconds;
  double? totalVolume;
  int? totalSets;
  WorkoutStats({
    this.totalVolume = 0,
    this.totalSets = 0,
    this.hours,
    this.minutes,
    this.seconds,
  });
}

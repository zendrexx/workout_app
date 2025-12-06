import 'package:isar/isar.dart';

part 'workout_stats.g.dart';

@collection
class WorkoutStats {
  Id id = Isar.autoIncrement;
  final int? hours;
  final int? minutes;
  final int? seconds;
  final double? tempTotalVolume;
  final int? tempTotalSets;
  WorkoutStats({
    this.tempTotalVolume = 0,
    this.tempTotalSets = 0,
    this.hours,
    this.minutes,
    this.seconds,
  });
}

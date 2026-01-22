import 'package:isar/isar.dart';

part 'workout_stats_isar.g.dart';

@collection
class WorkoutStatsIsar {
  Id id = Isar.autoIncrement;

  int? totalSeconds;
  double? totalVolume;
  int? totalSets;
  WorkoutStatsIsar({
    this.totalVolume = 0,
    this.totalSets = 0,
    this.totalSeconds,
  });
}

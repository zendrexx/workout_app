import 'package:isar/isar.dart';

part 'workout_stats_isar.g.dart';

@collection
class WorkoutStatsIsar {
  Id id = Isar.autoIncrement;

  late int totalSeconds;
  late double totalVolume;
  late int totalSets;
}

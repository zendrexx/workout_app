import 'package:isar/isar.dart';

part 'performed_stats_isar.g.dart';

@embedded
class PerformedStatsIsar {
  int totalSeconds = 0;
  double totalVolume = 0.0;
  int totalSets = 0;
  PerformedStatsIsar({
    this.totalSeconds = 0,
    this.totalVolume = 0.0,
    this.totalSets = 0,
  });
}

import 'package:isar/isar.dart';

part 'performed_stats_isar.g.dart';

@collection
class PerformedStatsIsar {
  Id id = Isar.autoIncrement;

  late int totalSeconds;
  late double totalVolume;
  late int totalSets;
}

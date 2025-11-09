// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

class TempWorkoutStats {
  final int? hours;
  final int? minutes;
  final int? seconds;
  final double? tempTotalVolume;
  final int? tempTotalSets;
  TempWorkoutStats({
    this.tempTotalVolume = 0,
    this.tempTotalSets = 0,
    this.hours,
    this.minutes,
    this.seconds,
  });

  TempWorkoutStats copyWith({
    int? hours,
    int? minutes,
    int? seconds,
    double? tempTotalVolume,
    int? tempTotalSets,
  }) {
    return TempWorkoutStats(
      hours: hours ?? this.hours,
      minutes: minutes ?? this.minutes,
      seconds: seconds ?? this.seconds,
      tempTotalVolume: tempTotalVolume ?? this.tempTotalVolume,
      tempTotalSets: tempTotalSets ?? this.tempTotalSets,
    );
  }
}

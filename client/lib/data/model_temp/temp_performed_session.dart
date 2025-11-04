// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:client/data/model_temp/temp_performed_exercise.dart';

class TempPerformedSession {
  int? id;
  late String? name;
  DateTime createdAt = DateTime.now();
  bool isCompleted = false;
  int? hours;
  int? minutes;
  int? seconds;
  Float? volume;
  int? totalSets;
  final List<TempPerformedExercise> performedExercise;
  TempPerformedSession({
    this.name,
    required this.isCompleted,
    this.performedExercise = const [],
    this.id,
    this.hours,
    this.minutes,
    this.seconds,
    this.volume,
    this.totalSets,
  });

  TempPerformedSession copyWith({
    int? id,
    String? name,
    bool? isCompleted,
    int? hours,
    int? minutes,
    int? seconds,
    Float? volume,
    int? totalSets,
    List<TempPerformedExercise>? performedExercise,
  }) {
    return TempPerformedSession(
      id: id ?? this.id,
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
      hours: hours ?? this.hours,
      minutes: minutes ?? this.minutes,
      seconds: seconds ?? this.seconds,
      volume: volume ?? this.volume,
      totalSets: totalSets ?? this.totalSets,
      performedExercise: performedExercise ?? this.performedExercise,
    );
  }
}

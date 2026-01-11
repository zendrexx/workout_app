// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

import 'exercise_isar.dart';

part 'performed_set.g.dart';

@collection
class PerformedSet {
  Id id = Isar.autoIncrement;

  double? performedWeight;
  int? performedRep;

  final exercise = IsarLink<ExerciseIsar>();

  PerformedSet({this.performedWeight, this.performedRep});

  PerformedSet copyWith({double? performedWeight, int? performedRep}) {
    return PerformedSet(
      performedWeight: performedWeight ?? this.performedWeight,
      performedRep: performedRep ?? this.performedRep,
    );
  }
}

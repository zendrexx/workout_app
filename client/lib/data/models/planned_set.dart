// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

import 'exercise.dart';

part 'planned_set.g.dart';

@collection
class PlannedSet {
  Id id = Isar.autoIncrement;

  double? estWeight;
  int? minRep;
  int? maxRep;

  final exercise = IsarLink<Exercise>();

  PlannedSet({this.estWeight, this.minRep, this.maxRep});

  PlannedSet copyWith({double? estWeight, int? minRep, int? maxRep}) {
    return PlannedSet(
      estWeight: estWeight ?? this.estWeight,
      minRep: minRep ?? this.minRep,
      maxRep: maxRep ?? this.maxRep,
    );
  }
}

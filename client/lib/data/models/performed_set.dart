// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

import 'exercise.dart';

part 'performed_set.g.dart';

@collection
class PerformedSet {
  Id id = Isar.autoIncrement;

  double? estWeight;
  int? minRep;
  int? maxRep;

  final exercise = IsarLink<Exercise>();

  PerformedSet({this.estWeight, this.minRep, this.maxRep});

  PerformedSet copyWith({double? estWeight, int? minRep, int? maxRep}) {
    return PerformedSet(
      estWeight: estWeight ?? this.estWeight,
      minRep: minRep ?? this.minRep,
      maxRep: maxRep ?? this.maxRep,
    );
  }
}

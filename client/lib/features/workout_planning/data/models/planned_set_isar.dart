// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

import '../../../../data/models/exercise.dart';

part 'planned_set_isar.g.dart';

@collection
class PlannedSetIsar {
  Id id = Isar.autoIncrement;

  double? estWeight;
  int? minRep;
  int? maxRep;

  final exercise = IsarLink<Exercise>();

  PlannedSetIsar({this.estWeight, this.minRep, this.maxRep});

  PlannedSetIsar copyWith({double? estWeight, int? minRep, int? maxRep}) {
    return PlannedSetIsar(
      estWeight: estWeight ?? this.estWeight,
      minRep: minRep ?? this.minRep,
      maxRep: maxRep ?? this.maxRep,
    );
  }
}

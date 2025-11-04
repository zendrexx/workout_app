// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/data/models/exercise.dart';

class TempPerformedSets {
  double? actWeight;
  double? prevWeight;
  int? actRep;
  bool isDone;

  TempPerformedSets({this.actWeight, this.actRep, this.isDone = false});

  TempPerformedSets copyWith({double? actWeight, int? actRep, bool? isDone}) {
    return TempPerformedSets(
      actWeight: actWeight ?? this.actWeight,
      actRep: actRep ?? this.actRep,
      isDone: isDone ?? this.isDone,
    );
  }
}

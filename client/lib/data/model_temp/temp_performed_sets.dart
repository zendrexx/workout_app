// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/data/models/exercise.dart';

class TempPerformedSets {
  double? estWeight = 0;
  int? minRep = 0;
  int? maxRep;
  TempPerformedSets({this.estWeight, this.minRep, this.maxRep});

  TempPerformedSets copyWith({double? estWeight, int? minRep, int? maxRep}) {
    return TempPerformedSets(
      estWeight: estWeight ?? this.estWeight,
      minRep: minRep ?? this.minRep,
      maxRep: maxRep ?? this.maxRep,
    );
  }
}

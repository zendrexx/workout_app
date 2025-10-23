// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/data/models/exercise.dart';

class TempPlannedSets {
  double? estWeight = 0;
  int? minRep = 0;
  int? maxRep;
  TempPlannedSets({this.estWeight, this.minRep, this.maxRep});

  TempPlannedSets copyWith({double? estWeight, int? minRep, int? maxRep}) {
    return TempPlannedSets(
      estWeight: estWeight ?? this.estWeight,
      minRep: minRep ?? this.minRep,
      maxRep: maxRep ?? this.maxRep,
    );
  }
}

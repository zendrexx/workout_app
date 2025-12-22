// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/data/models/exercise.dart';

class TempPlannedSets {
  double? estWeight = 0;
  int? minRep = 0;
  int? maxRep;
  int? actRep = 0;
  double? actWeight = 0;
  TempPlannedSets({
    this.estWeight,
    this.minRep,
    this.maxRep,
    this.actRep,
    this.actWeight,
  });

  TempPlannedSets copyWith({
    double? estWeight,
    int? minRep,
    int? maxRep,
    double? actWeight,
    int? actRep,
  }) {
    return TempPlannedSets(
      estWeight: estWeight ?? this.estWeight,
      minRep: minRep ?? this.minRep,
      maxRep: maxRep ?? this.maxRep,
      actRep: actRep ?? this.actRep,
      actWeight: actWeight ?? this.actWeight,
    );
  }
}

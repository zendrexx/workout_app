import 'package:client/data/model_temp/temp_planned_sets.dart';
import 'package:client/data/models/planned_set.dart';

extension TempPlannedSetMapper on TempPlannedSets {
  PlannedSet toPlannedSet() {
    return PlannedSet(
      estWeight: estWeight,
      minRep: minRep,
      maxRep: maxRep,
      // add other properties if you have them
    );
  }
}

import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';

extension PlannedSetCopy on PlannedSetIsar {
  PlannedSetIsar deepCopy() {
    return PlannedSetIsar(estWeight: estWeight, minRep: minRep, maxRep: maxRep);
  }
}

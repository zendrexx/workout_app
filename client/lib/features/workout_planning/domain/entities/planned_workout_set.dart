// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlannedWorkoutSet {
  final int minRep;
  final int maxRep;
  final double estWeight;
  final String setId;

  PlannedWorkoutSet({
    required this.minRep,
    required this.maxRep,
    required this.estWeight,
    required this.setId,
  });

  double get getEstVolume {
    int aveWeight = ((minRep + maxRep) / 2).toInt();
    if (aveWeight == 0) return 0;
    return aveWeight * estWeight;
  }

  PlannedWorkoutSet copyWith({
    int? minRep,
    int? maxRep,
    double? estWeight,
    String? setId,
  }) {
    return PlannedWorkoutSet(
      minRep: minRep ?? this.minRep,
      maxRep: maxRep ?? this.maxRep,
      estWeight: estWeight ?? this.estWeight,
      setId: setId ?? this.setId,
    );
  }
}

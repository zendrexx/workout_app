class PlannedWorkoutSet {
  final int minRep;
  final int maxRep;
  final double estWeight;

  PlannedWorkoutSet({
    required this.minRep,
    required this.maxRep,
    required this.estWeight,
  });

  double get getEstVolume {
    int aveWeight = ((minRep + maxRep) / 2).toInt();
    if (aveWeight == 0) return 0;
    return aveWeight * estWeight;
  }
}

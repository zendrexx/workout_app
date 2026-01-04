class PlannedWorkoutSet {
  final int reps;
  final double weight;

  PlannedWorkoutSet({required this.reps, required this.weight});

  double get getVolume {
    if (reps == 0) return 0;
    return reps * weight;
  }
}

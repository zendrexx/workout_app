/// Estimates a one-rep max from a completed set using the Epley formula:
/// weight × (1 + reps / 30).
///
/// Sets above 12 reps are graded as 12 — rep-max formulas lose accuracy in
/// high rep ranges and a 20-rep set should not out-score a heavy triple.
double estimateOneRepMax({required double weightLbs, required int reps}) {
  if (weightLbs <= 0 || reps <= 0) return 0;
  if (reps == 1) return weightLbs;
  final cappedReps = reps > 12 ? 12 : reps;
  return weightLbs * (1 + cappedReps / 30);
}

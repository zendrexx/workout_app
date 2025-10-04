class Workoutsets {
  int id;
  double? estWeight;
  double actWeight;
  int? minRep;
  int? maxRep;
  int? actualRep;
  bool isCompleted;

  Workoutsets({
    required this.id,
    this.estWeight,
    required this.actWeight,
    this.minRep,
    this.maxRep,
    required this.actualRep,
    this.isCompleted = false,
  });
}

class TempPerformedSession {
  int? id;
  late String? name;
  DateTime createdAt = DateTime.now();
  bool isCompleted = false;
  final List<TempPerformedExercise> performedExercise;
  TempPerformedSession({
    this.name,
    required this.isCompleted,
    this.performedExercise = const [],
    this.id,
  });
}

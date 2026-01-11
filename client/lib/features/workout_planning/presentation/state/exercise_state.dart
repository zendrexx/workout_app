// ignore_for_file: public_member_api_docs, sort_constructors_first
class ExerciseState {
  final String exId;

  final String name;

  final String primMuscle;

  final String? seconMuscle;
  final String? equipment;
  final String? imagePath;
  ExerciseState({
    required this.exId,
    required this.name,
    required this.primMuscle,
    this.equipment,
    this.imagePath,
    this.seconMuscle,
  });

  ExerciseState copyWith({
    String? exId,
    String? name,
    String? primMuscle,
    String? seconMuscle,
    String? equipment,
    String? imagePath,
  }) {
    return ExerciseState(
      exId: exId ?? this.exId,
      name: name ?? this.name,
      primMuscle: primMuscle ?? this.primMuscle,
      seconMuscle: seconMuscle ?? this.seconMuscle,
      equipment: equipment ?? this.equipment,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}

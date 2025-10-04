import 'package:isar/isar.dart';

part 'exercise.g.dart';

@collection
class Exercise {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late String exId;

  @Index(caseSensitive: false)
  late String name;

  @Index(caseSensitive: false)
  late String primMuscle;
  late String seconMuscle;
  late String equipment;
  late String imagePath;

  Exercise({
    required this.exId,
    required this.name,
    required this.primMuscle,
    required this.seconMuscle,
    required this.equipment,
    required this.imagePath,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      exId: json['id'],
      name: json['name'],
      primMuscle: json['primMuscle'],
      seconMuscle: json['seconMuscle'],
      equipment: json['equipment'],
      imagePath: json['imagePath'],
    );
  }
}

import 'package:isar/isar.dart';

part 'exercise_isar.g.dart';

@collection
class ExerciseIsar {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late String exId;

  @Index(caseSensitive: false)
  late String name;

  @Index(caseSensitive: false)
  late String primMuscle;

  late String? seconMuscle;
  late String equipment;
  late String imagePath;

  @Index(caseSensitive: false)
  String? category;

  ExerciseIsar({
    required this.exId,
    required this.name,
    required this.primMuscle,
    this.seconMuscle,
    required this.equipment,
    required this.imagePath,
    this.category,
  });

  factory ExerciseIsar.fromJson(Map<String, dynamic> json) {
    return ExerciseIsar(
      exId: json['id'],
      name: json['name'],
      primMuscle: json['primMuscle'],
      seconMuscle: json['seconMuscle'],
      equipment: json['equipment'],
      imagePath: json['imagePath'],
      category: json['category'],
    );
  }
}

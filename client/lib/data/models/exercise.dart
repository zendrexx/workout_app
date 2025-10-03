import 'package:isar/isar.dart';

part 'exercise.g.dart';

@collection
class Exercise {
  Id id = Isar.autoIncrement;

  late String exId;
  late String name;
  late String primMuscle;
  late String seconMuscle;
  late String equipment;
  late String imagePath;

  Exercise();

  factory Exercise.fromJson(Map<String, dynamic> json) {
    final e = Exercise()
      ..exId = json['id']
      ..name = json['name']
      ..primMuscle = json['primMuscle']
      ..seconMuscle = json['seconMuscle']
      ..equipment = json['equipment']
      ..imagePath = json['imagePath'];
    return e;
  }
}

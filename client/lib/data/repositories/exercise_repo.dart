import 'package:client/data/models/exercise.dart';
import 'package:isar/isar.dart';

class ExerciseRepo {
  final Isar isar;
  ExerciseRepo(this.isar);
  Future<Exercise?> getById(int exId) async {
    return isar.exercises.filter().exIdEqualTo(exId.toString()).findFirst();
  }

  Future<List<Exercise?>> getAll(int exId) async {
    return isar.exercises.where().findAll();
  }
}

import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/domain/repositories/program_repository.dart';

class WatchAllWeeks {
  final ProgramRepository repo;

  WatchAllWeeks(this.repo);

  Stream<List<Program>> call() {
    return repo.watchAllPrograms();
  }
}

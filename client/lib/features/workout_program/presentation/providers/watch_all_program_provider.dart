import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/domain/repositories/program_repository.dart';
import 'package:client/features/workout_program/domain/usecases/watch_all_program.dart';
import 'package:client/features/workout_program/presentation/providers/program_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final watchAllProgramProvider = Provider<WatchAllProgram>((ref) {
  final repo = ref.read(programRepositoryProvider);
  return WatchAllProgram(repo);
});

import 'package:client/features/workout_program/domain/usecases/add_program.dart';
import 'package:client/features/workout_program/presentation/providers/program_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addProgramProvider = Provider<AddProgram>((ref) {
  final repo = ref.read(programRepositoryProvider);
  return AddProgram(repo);
});

import 'package:client/features/workout_program/domain/usecases/duplicate_program.dart';
import 'package:client/features/workout_program/presentation/providers/program_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final duplicateProgramProvider = Provider<DuplicateProgram>((ref) {
  final repo = ref.read(programRepositoryProvider);
  return DuplicateProgram(repo);
});

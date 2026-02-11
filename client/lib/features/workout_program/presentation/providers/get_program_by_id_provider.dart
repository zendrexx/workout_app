import 'package:client/features/workout_program/domain/usecases/get_program_by_id.dart';
import 'package:client/features/workout_program/presentation/providers/program_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getProgramByIdProvider = Provider<GetProgramById>((ref) {
  final repo = ref.read(programRepositoryProvider);
  return GetProgramById(repo);
});

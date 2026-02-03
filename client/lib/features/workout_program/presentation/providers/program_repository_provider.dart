import 'package:client/features/workout_program/data/repositories/program_repository_impl.dart';
import 'package:client/features/workout_program/domain/repositories/program_repository.dart';
import 'package:client/features/workout_program/presentation/providers/program_datasource_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final programRepositoryProvider = Provider<ProgramRepository>((ref) {
  final datasource = ref.read(programDatasourceProvider);
  return ProgramRepositoryImpl(datasource);
});

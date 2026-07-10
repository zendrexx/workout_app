import 'package:client/core/database/database_service.dart';
import 'package:client/features/workout_program/data/datasources/active_program_isar_datasource.dart';
import 'package:client/features/workout_program/data/repositories/active_program_repository_impl.dart';
import 'package:client/features/workout_program/domain/entities/active_program.dart';
import 'package:client/features/workout_program/domain/repositories/active_program_repository.dart';
import 'package:client/features/workout_program/domain/usecases/clear_active_program.dart';
import 'package:client/features/workout_program/domain/usecases/get_active_program.dart';
import 'package:client/features/workout_program/domain/usecases/restart_active_program.dart';
import 'package:client/features/workout_program/domain/usecases/save_active_program.dart';
import 'package:client/features/workout_program/domain/usecases/start_program.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final activeProgramDatasourceProvider = Provider<ActiveProgramIsarDatasource>((
  ref,
) {
  final isar = ref.watch(isarProvider).requireValue;
  return ActiveProgramIsarDatasource(isar);
});

final activeProgramRepositoryProvider = Provider<ActiveProgramRepository>((ref) {
  final datasource = ref.read(activeProgramDatasourceProvider);
  return ActiveProgramRepositoryImpl(datasource);
});

final getActiveProgramProvider = Provider<GetActiveProgram>((ref) {
  return GetActiveProgram(ref.read(activeProgramRepositoryProvider));
});

final saveActiveProgramProvider = Provider<SaveActiveProgram>((ref) {
  return SaveActiveProgram(ref.read(activeProgramRepositoryProvider));
});

final restartActiveProgramProvider = Provider<RestartActiveProgram>((ref) {
  return RestartActiveProgram(ref.read(activeProgramRepositoryProvider));
});

final clearActiveProgramProvider = Provider<ClearActiveProgram>((ref) {
  return ClearActiveProgram(ref.read(activeProgramRepositoryProvider));
});

final startProgramProvider = Provider<StartProgram>((ref) {
  return StartProgram(ref.read(activeProgramRepositoryProvider));
});

/// The user's current active program (or null if none). Invalidate this after
/// a program workout is finished so the Home page recomputes today's workout.
final activeProgramProvider = FutureProvider<ActiveProgram?>((ref) {
  return ref.read(getActiveProgramProvider).call();
});

import 'package:client/core/database/database_service.dart';
import 'package:client/features/workout_program/data/datasources/program_session_isar_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final programDatasourceProvider = Provider<ProgramSessionIsarDatasource>((ref) {
  final isar = ref.watch(isarProvider).requireValue;
  return ProgramSessionIsarDatasource(isar);
});

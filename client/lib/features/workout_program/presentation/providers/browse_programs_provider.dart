import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/presentation/providers/watch_all_program_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Every program template available to browse, live from the database.
final browseProgramsProvider = StreamProvider.autoDispose<List<Program>>((
  ref,
) {
  return ref.read(watchAllProgramProvider).call();
});

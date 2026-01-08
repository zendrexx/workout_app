// import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
// import 'package:client/core/database/database_service.dart';
// import 'package:client/data/repositories/planned_session_repo.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:isar/isar.dart';

// final plannedSessionStreamProvider = StreamProvider<List<PlannedSession>>((
//   ref,
// ) async* {
//   final isar = DatabaseService.db;
//   final service = PlannedSessionService();

//   // Watch all session changes and reload with links each time
//   yield* isar.plannedSessions.where().watch(fireImmediately: true).asyncMap((
//     _,
//   ) async {
//     final sessions = await service.getAllPlannedSession();
//     return sessions;
//   });
// });

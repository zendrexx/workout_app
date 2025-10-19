import 'package:client/data/models/planned_session.dart';
import 'package:client/data/services/database_service.dart';
import 'package:client/data/services/planned_session_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final plannedSessionStreamProvider = StreamProvider<List<PlannedSession>>((
  ref,
) async* {
  final isar = DatabaseService.db;
  yield* isar.plannedSessions.where().watch(fireImmediately: true);
});

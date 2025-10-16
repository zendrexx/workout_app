import 'package:client/data/models/planned_session.dart';
import 'package:client/data/services/planned_session_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final plannedSessionListProvider = FutureProvider<List<PlannedSession>>((
  ref,
) async {
  final repo = PlannedSessionService();
  return repo.getAllPlannedSession();
});

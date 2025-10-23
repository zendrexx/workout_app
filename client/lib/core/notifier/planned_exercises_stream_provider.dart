import 'package:client/data/models/planned_exercise.dart';
import 'package:client/data/models/planned_session.dart';
import 'package:client/data/services/database_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final plannedExercisesStreamProvider =
    StreamProvider.family<List<PlannedExercise>, int>((ref, sessionId) async* {
      final isar = DatabaseService.db;

      yield* isar.plannedSessions
          .watchObject(sessionId, fireImmediately: true)
          .asyncMap((session) async {
            if (session == null) return [];

            await session.plannedExercise.load();
            final exercises = session.plannedExercise.toList();

            return exercises;
          });
    });

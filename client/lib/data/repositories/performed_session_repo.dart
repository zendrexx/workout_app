import 'package:client/data/model_temp/temp_session.dart';
import 'package:client/data/model_temp/temp_workout_stats.dart';
import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/performed_exercise.dart';
import 'package:client/data/models/performed_session.dart';
import 'package:client/data/models/performed_set.dart';
import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';
import 'package:client/data/models/workout_stats.dart';
import 'package:client/core/database/database_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

class PerformedSessionRepo {
  final Isar isar;

  PerformedSessionRepo(this.isar);
  Future<List<PerformedSession>> getAllPerformedSession() async {
    // Fetch all sessions
    final sessions = await isar.performedSessions.where().findAll();
    print("🟦 Found ${sessions.length} sessions");
    // Load all links (PlannedExercise and Exercise)
    for (final session in sessions) {
      await session.performedExercises.load();
      print("  🟨plannedExercise count: ${session.performedExercises.length}");
      // Then for each plannedExercise, load its exercise link
    }

    return sessions;
  }

  Future<PerformedSession?> getSessionById(int id) async {
    final session = await isar.performedSessions.get(id);
    if (session == null) {
      print("❌ Session with id $id not found");
      return null;
    }

    // Load linked exercises
    await session.performedExercises.load();

    print(
      "✅ Loaded session '${session.name}' with ${session.performedExercises.length} planned exercises",
    );
    return session;
  }

  Future<void> addSession(PlannedSession plannedSession) async {
    await isar.writeTxn(
      () async => await isar.plannedSessions.put(plannedSession),
    );
  }

  Future<void> saveLogSession(
    TempSession tempSession,
    TempWorkoutStats tempStats,
    WidgetRef ref,
  ) async {
    await isar.writeTxn(() async {
      PerformedSession performedSession = PerformedSession();

      performedSession.name = tempSession.name;
      performedSession.isCompleted = true;

      final allSets = <PerformedSet>[];
      for (final tempExercise in tempSession.plannedExercise) {
        for (final tempSet in tempExercise.sets) {
          final set = PerformedSet()
            ..performedWeight = tempSet.actWeight
            ..performedRep = tempSet.actRep;

          allSets.add(set);
        }
      }
      await isar.performedSets.putAll(allSets);

      final performedExercises = <PerformedExercise>[];
      int setIndex = 0;
      for (final tempExercise in tempSession.plannedExercise) {
        final numSets = tempExercise.sets.length;
        final exerciseSets = allSets.sublist(setIndex, setIndex + numSets);
        setIndex += numSets;

        final performedExercise = PerformedExercise()
          ..exId = tempExercise.exercise?.exId
          ..notes = tempExercise.notes
          ..exerciseName = tempExercise.exercise?.name
          ..exercisePath = tempExercise.exercise?.imagePath
          ..equipment = tempExercise.exercise?.equipment;

        await isar.performedExercises.put(performedExercise);
        performedExercise.sets.addAll(exerciseSets);
        await performedExercise.sets.save();

        performedExercises.add(performedExercise);
      }
      //WorkoutStats
      final performedWorkoutStats = WorkoutStats()
        ..totalVolume = tempStats.tempTotalVolume
        ..totalSets = tempStats.tempTotalSets
        ..hours = tempStats.hours
        ..minutes = tempStats.minutes
        ..seconds = tempStats.seconds;

      await isar.performedSessions.put(performedSession);
      performedSession.performedExercises.addAll(performedExercises);
      performedSession.workoutStats.add(performedWorkoutStats);
      await performedSession.performedExercises.save();
      await performedSession.workoutStats.save();
    });
  }

  Future<void> saveSession(TempSession tempSession, WidgetRef ref) async {
    await isar.writeTxn(() async {
      PlannedSession? plannedSession;

      //Check if editing an existing session
      if (tempSession.id != null) {
        plannedSession = await isar.plannedSessions.get(tempSession.id!);

        if (plannedSession != null) {
          //Clean up old linked data before replacing
          await plannedSession.plannedExercise.load();

          for (final oldEx in plannedSession.plannedExercise) {
            await oldEx.sets.load();
            // delete all sets linked to old exercise
            await isar.plannedSets.deleteAll(
              oldEx.sets.map((e) => e.id).toList(),
            );
          }

          // delete all old exercises linked to the session
          await isar.plannedExercises.deleteAll(
            plannedSession.plannedExercise.map((e) => e.id).toList(),
          );

          plannedSession.plannedExercise.clear();
        }
      }

      // STEP 1: Create new if null
      plannedSession ??= PlannedSession();

      // STEP 2: Update session name
      plannedSession.name = tempSession.name;

      // STEP 3: Recreate all sets and exercises
      final allSets = <PlannedSet>[];
      for (final tempExercise in tempSession.plannedExercise) {
        for (final tempSet in tempExercise.sets) {
          final set = PlannedSet()
            ..estWeight = tempSet.estWeight
            ..maxRep = tempSet.maxRep
            ..minRep = tempSet.minRep;
          allSets.add(set);
        }
      }
      await isar.plannedSets.putAll(allSets);

      final plannedExercises = <PlannedExercise>[];
      int setIndex = 0;
      for (final tempExercise in tempSession.plannedExercise) {
        final numSets = tempExercise.sets.length;
        final exerciseSets = allSets.sublist(setIndex, setIndex + numSets);
        setIndex += numSets;

        final plannedExercise = PlannedExercise()
          ..exId = tempExercise.exercise?.exId
          ..notes = tempExercise.notes
          ..exerciseName = tempExercise.exercise?.name
          ..exercisePath = tempExercise.exercise?.imagePath
          ..equipment = tempExercise.exercise?.equipment;

        await isar.plannedExercises.put(plannedExercise);
        plannedExercise.sets.addAll(exerciseSets);
        await plannedExercise.sets.save();

        plannedExercises.add(plannedExercise);
      }

      // Save session and link exercises
      await isar.plannedSessions.put(plannedSession);
      plannedSession.plannedExercise.addAll(plannedExercises);
      await plannedSession.plannedExercise.save();
    });
  }
}

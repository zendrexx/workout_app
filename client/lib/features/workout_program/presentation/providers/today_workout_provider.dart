import 'package:client/features/workout_program/domain/services/program_schedule.dart';
import 'package:client/features/workout_program/presentation/providers/active_program_providers.dart';
import 'package:client/features/workout_program/presentation/providers/program_repository_provider.dart';
import 'package:client/features/workout_program/presentation/state/today_workout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Resolves the active program into today's workout / rest / completed state.
/// Recomputes automatically when [activeProgramProvider] is invalidated.
final todayWorkoutProvider = FutureProvider.autoDispose<TodayWorkout>((
  ref,
) async {
  final active = await ref.watch(activeProgramProvider.future);
  if (active == null) return TodayWorkout.none();

  final program = await ref
      .read(programRepositoryProvider)
      .getProgramById(active.templateProgramId);

  if (program == null) return TodayWorkout.none();

  if (active.isCompleted) {
    return TodayWorkout(status: TodayStatus.completed, program: program);
  }

  final today = sessionForDay(program, active.currentWeek, active.currentDay);
  final next = nextWorkoutFrom(program, active.currentWeek, active.currentDay);

  final status = today != null
      ? TodayStatus.workout
      : next != null
      ? TodayStatus.rest
      : TodayStatus.completed;

  return TodayWorkout(
    status: status,
    program: program,
    week: active.currentWeek,
    day: active.currentDay,
    todaySession: today,
    nextWeek: next?.week,
    nextDay: next?.day,
    nextSession: next?.session,
  );
});

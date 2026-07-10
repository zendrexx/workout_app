import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/domain/entities/program_session.dart';

enum TodayStatus {
  /// Today (current position) is a scheduled workout day.
  workout,

  /// Today is a rest day, but there is still an upcoming workout.
  rest,

  /// The whole program has been finished.
  completed,

  /// No active program is set.
  none,
}

/// Resolved view of "what should the user do right now" for their active
/// program, computed from the active program's current (week, day) position.
class TodayWorkout {
  final TodayStatus status;
  final Program? program;

  /// Current position within the program.
  final int week;
  final int day;

  /// Session scheduled at the current position (null on a rest day).
  final ProgramSession? todaySession;

  /// Coordinates + session of the next actual workout (used by Start Workout).
  /// Equal to today's position on a workout day; points ahead on a rest day.
  final int? nextWeek;
  final int? nextDay;
  final ProgramSession? nextSession;

  const TodayWorkout({
    required this.status,
    this.program,
    this.week = 0,
    this.day = 0,
    this.todaySession,
    this.nextWeek,
    this.nextDay,
    this.nextSession,
  });

  factory TodayWorkout.none() => const TodayWorkout(status: TodayStatus.none);

  bool get hasNextWorkout => nextSession != null;
}

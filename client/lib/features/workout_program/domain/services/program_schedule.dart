import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/domain/entities/program_session.dart';
import 'package:client/features/workout_program/domain/entities/week.dart';

/// Pure scheduling helpers over a [Program]'s week/day structure.
///
/// A program week owns sessions keyed by [ProgramSession.dayNumber] (1..7).
/// Any day (1..7) without a session is treated as a rest day.
const int daysPerWeek = 7;

int totalWeeks(Program program) {
  var max = 0;
  for (final w in program.week) {
    if (w.weekNumber > max) max = w.weekNumber;
  }
  return max;
}

Week? _weekByNumber(Program program, int weekNumber) {
  for (final w in program.week) {
    if (w.weekNumber == weekNumber) return w;
  }
  return null;
}

/// The session scheduled at exactly (week, day), or null if it's a rest day.
ProgramSession? sessionForDay(Program program, int week, int day) {
  final w = _weekByNumber(program, week);
  if (w == null) return null;
  for (final s in w.sessions) {
    if (s.dayNumber == day) return s;
  }
  return null;
}

/// The first workout at or after (week, day), scanning forward across weeks.
/// Returns null when the program has no more workouts (i.e. it's finished).
({int week, int day, ProgramSession session})? nextWorkoutFrom(
  Program program,
  int week,
  int day,
) {
  final weeks = totalWeeks(program);
  for (var w = week; w <= weeks; w++) {
    final startDay = (w == week) ? day : 1;
    for (var d = startDay; d <= daysPerWeek; d++) {
      final session = sessionForDay(program, w, d);
      if (session != null) return (week: w, day: d, session: session);
    }
  }
  return null;
}

/// The calendar position one day after (week, day), rolling into the next week.
/// Returns null when that would move past the end of the program.
({int week, int day})? nextDayPosition(Program program, int week, int day) {
  final weeks = totalWeeks(program);
  var nextDay = day + 1;
  var nextWeek = week;
  if (nextDay > daysPerWeek) {
    nextDay = 1;
    nextWeek += 1;
  }
  if (nextWeek > weeks) return null;
  return (week: nextWeek, day: nextDay);
}

import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/workout_program/presentation/providers/program_view_model_provider.dart';
import 'package:client/features/workout_program/presentation/providers/today_workout_provider.dart';
import 'package:client/features/workout_program/presentation/state/program_session_state.dart';
import 'package:client/features/workout_program/presentation/state/today_workout.dart';
import 'package:client/features/workout_program/presentation/state/week_program_state.dart';
import 'package:client/features/workout_program/presentation/widgets/program_day_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ViewProgramPage extends ConsumerStatefulWidget {
  final String sessionId;
  const ViewProgramPage({super.key, required this.sessionId});

  @override
  ConsumerState<ViewProgramPage> createState() => _ViewProgramPageState();
}

class _ViewProgramPageState extends ConsumerState<ViewProgramPage> {
  /// Keys ("weekId/sessionId") of the day cards currently expanded.
  final Set<String> _expandedSessions = {};

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(programViewModelProvider.notifier)
          .loadProgramById(widget.sessionId);
    });
  }

  String _sessionKey(WeekState week, ProgramSessionState session) =>
      "${week.weekId}/${session.sessionId}";

  void _toggleSession(WeekState week, ProgramSessionState session) {
    final key = _sessionKey(week, session);
    setState(() {
      _expandedSessions.contains(key)
          ? _expandedSessions.remove(key)
          : _expandedSessions.add(key);
    });
  }

  void _toggleWeek(WeekState week) {
    final keys = week.session.map((s) => _sessionKey(week, s)).toSet();
    final allExpanded = keys.every(_expandedSessions.contains);
    setState(() {
      allExpanded
          ? _expandedSessions.removeAll(keys)
          : _expandedSessions.addAll(keys);
    });
  }

  /// Whether the session at (week, day) is behind the active program's
  /// current position, i.e. already performed.
  bool _isCompleted(TodayWorkout? today, int week, int day) {
    if (today == null) return false;
    if (today.status == TodayStatus.completed) return true;
    return week < today.week || (week == today.week && day < today.day);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(programViewModelProvider);

    // Active-program info drives the completed badges and the start button.
    // Only relevant when the viewed program is the active one.
    final todayAsync = ref.watch(todayWorkoutProvider);
    final today = todayAsync.valueOrNull;
    final isActiveProgram = today?.program?.programId == state.programId;

    final weeks = List<WeekState>.from(state.weekState)
      ..sort((a, b) => a.weekNumber.compareTo(b.weekNumber));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          state.programName.isEmpty ? "View Program" : state.programName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: Appcolors.backgroundColor,
        elevation: 5,
        shadowColor: Colors.black.withValues(alpha: 0.8),
        scrolledUnderElevation: 6,
        surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: Appcolors.backgroundColor,
      body: weeks.isEmpty
          ? const Center(
              child: Text(
                "No weeks in this program yet.",
                style: TextStyle(fontSize: 14, color: Colors.white30),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: weeks.length,
              itemBuilder: (context, index) => _WeekSection(
                week: weeks[index],
                expandedSessions: _expandedSessions,
                isCompleted: (day) => isActiveProgram
                    ? _isCompleted(today, weeks[index].weekNumber, day)
                    : false,
                onToggleSession: (session) =>
                    _toggleSession(weeks[index], session),
                onToggleWeek: () => _toggleWeek(weeks[index]),
                sessionKey: (session) => _sessionKey(weeks[index], session),
              ),
            ),
      bottomNavigationBar: isActiveProgram && today!.hasNextWorkout
          ? _StartWorkoutBar(
              programId: state.programId,
              week: today.nextWeek!,
              day: today.nextDay!,
            )
          : null,
    );
  }
}

class _WeekSection extends StatelessWidget {
  final WeekState week;
  final Set<String> expandedSessions;
  final bool Function(int dayNumber) isCompleted;
  final void Function(ProgramSessionState session) onToggleSession;
  final VoidCallback onToggleWeek;
  final String Function(ProgramSessionState session) sessionKey;

  const _WeekSection({
    required this.week,
    required this.expandedSessions,
    required this.isCompleted,
    required this.onToggleSession,
    required this.onToggleWeek,
    required this.sessionKey,
  });

  @override
  Widget build(BuildContext context) {
    final sessions = List<ProgramSessionState>.from(week.session)
      ..sort((a, b) => a.dayNumber.compareTo(b.dayNumber));

    final allExpanded =
        sessions.isNotEmpty &&
        sessions.every((s) => expandedSessions.contains(sessionKey(s)));

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Week ${week.weekNumber}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              if (sessions.isNotEmpty)
                GestureDetector(
                  onTap: onToggleWeek,
                  child: Text(
                    allExpanded ? "Collapse all" : "Expand all",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          if (sessions.isEmpty)
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                "No sessions in this week.",
                style: TextStyle(fontSize: 14, color: Colors.white30),
              ),
            )
          else
            ...sessions.map(
              (session) => ProgramDayCard(
                session: session,
                isCompleted: isCompleted(session.dayNumber),
                isExpanded: expandedSessions.contains(sessionKey(session)),
                onToggle: () => onToggleSession(session),
              ),
            ),
        ],
      ),
    );
  }
}

class _StartWorkoutBar extends StatelessWidget {
  final String programId;
  final int week;
  final int day;

  const _StartWorkoutBar({
    required this.programId,
    required this.week,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: () => context.push(
            '/home/log_workout?programId=$programId&week=$week&day=$day',
          ),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Appcolors.accent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "Start Week $week · Day $day",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

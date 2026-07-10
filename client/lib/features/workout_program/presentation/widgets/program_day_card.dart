import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/workout_planning/presentation/state/planned_exercise_state.dart';
import 'package:client/features/workout_program/presentation/state/program_session_state.dart';
import 'package:flutter/material.dart';

/// A collapsible card for one program day: "Day N · Session Name" with an
/// exercise/set summary, a completion badge, and the exercise list when
/// expanded.
class ProgramDayCard extends StatelessWidget {
  final ProgramSessionState session;
  final bool isCompleted;
  final bool isExpanded;
  final VoidCallback onToggle;

  const ProgramDayCard({
    super.key,
    required this.session,
    required this.isCompleted,
    required this.isExpanded,
    required this.onToggle,
  });

  int get _totalSets =>
      session.exercises.fold(0, (sum, exercise) => sum + exercise.sets.length);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Appcolors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Day ${session.dayNumber} · ${session.sessionName}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${session.exercises.length} exercises · $_totalSets sets",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Appcolors.muteText,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isCompleted) ...[
                  const _CompletedBadge(),
                  const SizedBox(width: 12),
                ],
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
              ],
            ),
            if (isExpanded) ...[
              const SizedBox(height: 12),
              const Divider(height: 1, color: Appcolors.secondaryColor),
              const SizedBox(height: 8),
              ...session.exercises.map(
                (exercise) => _ExerciseRow(exercise: exercise),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _CompletedBadge extends StatelessWidget {
  const _CompletedBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: const BoxDecoration(
        color: Appcolors.accent,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.check, size: 16, color: Colors.white),
    );
  }
}

class _ExerciseRow extends StatelessWidget {
  final PlannedExerciseState exercise;
  const _ExerciseRow({required this.exercise});

  /// Sets x reps, e.g. "5x3" or "3x8-10".
  String _setsLabel() {
    if (exercise.sets.isEmpty) return "-";
    final first = exercise.sets.first;
    final reps = first.minRep == first.maxRep
        ? "${first.minRep}"
        : "${first.minRep}-${first.maxRep}";
    return "${exercise.sets.length}x$reps";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              exercise.exerciseName,
              style: const TextStyle(fontSize: 14, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            _setsLabel(),
            style: const TextStyle(fontSize: 14, color: Appcolors.muteText),
          ),
        ],
      ),
    );
  }
}

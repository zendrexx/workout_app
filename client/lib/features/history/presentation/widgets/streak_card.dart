import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/history/presentation/providers/history_overview_provider.dart';
import 'package:client/features/history/presentation/widgets/tap_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Home streak card. The count and the four-week activity grid are both
/// derived from the days the user actually trained — no invented history.
class StreakCard extends ConsumerWidget {
  const StreakCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overview = ref.watch(historyOverviewProvider).valueOrNull;
    final streak = overview?.currentStreakDays ?? 0;
    final workoutDays = overview?.workoutDays ?? const <DateTime>{};

    return Container(
      decoration: BoxDecoration(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: const BoxDecoration(
              color: Appcolors.secondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Streak",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                TapTooltip(),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _ActivityGrid(workoutDays: workoutDays)),
                const SizedBox(width: 16),
                _StreakCount(streak: streak),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StreakCount extends StatelessWidget {
  final int streak;
  const _StreakCount({required this.streak});

  @override
  Widget build(BuildContext context) {
    final active = streak > 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              "$streak",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              streak == 1 ? "Day streak" : "Days streak",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(width: 8),
        Icon(
          Icons.local_fire_department,
          color: active ? Appcolors.momentum : Colors.grey.shade700,
          size: 70,
        ),
      ],
    );
  }
}

/// Four-week calendar grid (columns Sun→Sat, bottom row is the current week).
/// A day lights up only if the user trained on that exact date.
class _ActivityGrid extends StatelessWidget {
  final Set<DateTime> workoutDays;
  const _ActivityGrid({required this.workoutDays});

  static const int _weeks = 4;
  static const List<String> _dayLabels = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    // Sunday that starts the current week (Dart weekday: Mon=1..Sun=7).
    final currentSunday = today.subtract(Duration(days: today.weekday % 7));
    // Top-left cell: the Sunday (_weeks - 1) weeks before the current one.
    final gridStart = currentSunday.subtract(
      Duration(days: 7 * (_weeks - 1)),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (col) {
        return Column(
          children: [
            Text(
              _dayLabels[col],
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 8),
            ...List.generate(_weeks, (row) {
              final date = gridStart.add(Duration(days: row * 7 + col));
              final trained = workoutDays.contains(date);
              final isFuture = date.isAfter(today);
              final isToday = date == today;

              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: trained
                        ? Appcolors.momentum
                        : isFuture
                        ? Colors.transparent
                        : Colors.grey.shade800,
                    border: isToday && !trained
                        ? Border.all(color: Appcolors.momentum, width: 1)
                        : null,
                  ),
                ),
              );
            }),
          ],
        );
      }),
    );
  }
}

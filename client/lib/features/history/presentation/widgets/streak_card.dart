import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/history/presentation/providers/history_overview_provider.dart';
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
    final streakDayIndexByDate =
        overview?.streakDayIndexByDate ?? const <DateTime, int>{};

    return Container(
      decoration: BoxDecoration(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: _ActivityGrid(
              workoutDays: workoutDays,
              streakDayIndexByDate: streakDayIndexByDate,
            ),
          ),
          const SizedBox(width: 16),
          _StreakCount(streak: streak),
        ],
      ),
    );
  }
}

/// Escalating milestone colors so a longer streak visibly reads as a bigger
/// achievement: building (orange) → consistent (green) → dedicated (blue) →
/// elite (purple) → legendary (gold) at a full year. [streakDayIndex] is a
/// trained day's 1-based position within the current streak (day 1, day 2…),
/// not the raw streak total — so the grid can recolor day-by-day as it grows.
Color _streakTierColor(int streakDayIndex) {
  if (streakDayIndex >= 365) return Appcolors.gold;
  if (streakDayIndex >= 100) return Appcolors.accent;
  if (streakDayIndex >= 30) return Appcolors.info;
  if (streakDayIndex >= 15) return Appcolors.success;
  if (streakDayIndex > 0) return Appcolors.momentum;
  return Colors.grey.shade700;
}

class _StreakCount extends StatelessWidget {
  final int streak;
  const _StreakCount({required this.streak});

  @override
  Widget build(BuildContext context) {
    final active = streak > 0;
    final accent = _streakTierColor(streak);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.local_fire_department, color: accent, size: 32),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$streak",
              style: TextStyle(
                fontSize: 34,
                height: 1,
                fontWeight: FontWeight.bold,
                color: active ? Colors.white : Colors.grey.shade500,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              "d",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: accent,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        const Text(
          "day streak",
          style: TextStyle(color: Appcolors.muteText, fontSize: 12),
        ),
      ],
    );
  }
}

/// Four-week calendar grid (columns Sun→Sat). By default the bottom row is
/// the current week; the chevrons page back one 4-week block at a time.
/// Paging back stops once the earliest recorded workout has been shown, and
/// paging forward stops at the present — no invented history, no future.
class _ActivityGrid extends StatefulWidget {
  final Set<DateTime> workoutDays;

  /// Trained day → 1-based position within the current active streak.
  /// Dots for these days are tinted by milestone; trained days without an
  /// entry (outside the current streak) fall back to the base streak color.
  final Map<DateTime, int> streakDayIndexByDate;

  const _ActivityGrid({
    required this.workoutDays,
    required this.streakDayIndexByDate,
  });

  @override
  State<_ActivityGrid> createState() => _ActivityGridState();
}

class _ActivityGridState extends State<_ActivityGrid> {
  static const int _weeks = 4;
  static const List<String> _dayLabels = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  static const List<String> _monthAbbr = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  /// 0 = the most recent 4 weeks (bottom row is the current week). Each step
  /// back moves a full 4-week block further into the past.
  int _blockOffset = 0;

  /// Compact label for the visible block, e.g. "Jul 2026" when it sits
  /// inside one month, or "Jun – Jul 2026" when it spans two.
  String _blockLabel(DateTime start, DateTime end) {
    final startMonth = _monthAbbr[start.month - 1];
    final endMonth = _monthAbbr[end.month - 1];
    if (start.year == end.year && start.month == end.month) {
      return "$startMonth ${start.year}";
    }
    if (start.year == end.year) {
      return "$startMonth – $endMonth ${end.year}";
    }
    return "$startMonth ${start.year} – $endMonth ${end.year}";
  }

  DateTime? get _earliestWorkoutDay {
    if (widget.workoutDays.isEmpty) return null;
    return widget.workoutDays.reduce((a, b) => a.isBefore(b) ? a : b);
  }

  /// Sunday that starts the block [offset] steps back from the present one.
  DateTime _blockStart(int offset) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final currentSunday = today.subtract(Duration(days: today.weekday % 7));
    return currentSunday.subtract(
      Duration(days: 7 * (_weeks - 1) + 7 * _weeks * offset),
    );
  }

  bool get _canGoBack {
    final earliest = _earliestWorkoutDay;
    if (earliest == null) return false;
    final earliestSunday = earliest.subtract(
      Duration(days: earliest.weekday % 7),
    );
    return _blockStart(_blockOffset).isAfter(earliestSunday);
  }

  bool get _canGoForward => _blockOffset > 0;

  void _goPrev() {
    if (_canGoBack) setState(() => _blockOffset++);
  }

  void _goNext() {
    if (_canGoForward) setState(() => _blockOffset--);
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final gridStart = _blockStart(_blockOffset);
    final gridEnd = gridStart.add(Duration(days: 7 * _weeks - 1));

    return Column(
      children: [
        Row(
          children: [
            _NavArrow(
              icon: Icons.chevron_left,
              enabled: _canGoBack,
              onTap: _goPrev,
            ),
            Expanded(
              child: Center(
                child: Text(
                  _blockLabel(gridStart, gridEnd),
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ),
            _NavArrow(
              icon: Icons.chevron_right,
              enabled: _canGoForward,
              onTap: _goNext,
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
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
                  final trained = widget.workoutDays.contains(date);
                  final isFuture = date.isAfter(today);
                  final isToday = date == today;
                  final streakDayIndex = widget.streakDayIndexByDate[date];
                  final dotColor = streakDayIndex != null
                      ? _streakTierColor(streakDayIndex)
                      : Appcolors.momentum;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: trained
                            ? dotColor
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
        ),
      ],
    );
  }
}

class _NavArrow extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;
  const _NavArrow({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: enabled ? onTap : null,
      child: Icon(
        icon,
        size: 16,
        color: enabled ? Colors.grey.shade400 : Colors.grey.shade800,
      ),
    );
  }
}

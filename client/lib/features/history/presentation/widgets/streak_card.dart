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

/// Four-week calendar grid (columns Sun→Sat). By default the bottom row is
/// the current week; the chevrons page back one 4-week block at a time.
/// Paging back stops once the earliest recorded workout has been shown, and
/// paging forward stops at the present — no invented history, no future.
class _ActivityGrid extends StatefulWidget {
  final Set<DateTime> workoutDays;
  const _ActivityGrid({required this.workoutDays});

  @override
  State<_ActivityGrid> createState() => _ActivityGridState();
}

class _ActivityGridState extends State<_ActivityGrid> {
  static const int _weeks = 4;
  static const List<String> _dayLabels = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  static const List<String> _monthAbbr = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
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

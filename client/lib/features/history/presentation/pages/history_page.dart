import 'package:client/core/constants/AppColors.dart';
import 'package:client/core/utils/format_number.dart';
import 'package:client/features/history/domain/entities/history_overview.dart';
import 'package:client/features/history/presentation/providers/history_overview_provider.dart';
import 'package:client/features/history/presentation/widgets/history_empty_state.dart';
import 'package:client/features/history/presentation/widgets/history_session_card.dart';
import 'package:client/features/history/presentation/widgets/history_skeleton.dart';
import 'package:client/features/history/presentation/widgets/recent_records_strip.dart';
import 'package:client/features/history/presentation/widgets/weekly_volume_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Training history: recent momentum and the timeline of completed workouts.
///
/// Everything on this page is computed from stored performed sessions.
/// Sections appear only once the data supports them: the streak chip needs
/// two consecutive weeks, the volume chart needs three weeks of history.
/// Lifetime identity stats (total volume, day streak, SBD records) live on
/// the Profile page, not here.
class HistoryPage extends ConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overviewAsync = ref.watch(historyOverviewProvider);

    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          "HISTORY",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Appcolors.backgroundColor,
        elevation: 5,
        shadowColor: Colors.black.withValues(alpha: 0.8),
        scrolledUnderElevation: 6,
        surfaceTintColor: Colors.transparent,
      ),
      body: overviewAsync.when(
        loading: () => const HistorySkeleton(),
        error: (_, __) => const Center(
          child: Text(
            "Could not load your history",
            style: TextStyle(color: Colors.white),
          ),
        ),
        data: (overview) => overview.isEmpty
            ? const HistoryEmptyState()
            : _HistoryContent(overview: overview),
      ),
    );
  }
}

class _HistoryContent extends StatelessWidget {
  final HistoryOverview overview;
  const _HistoryContent({required this.overview});

  /// The chart only earns its place once there are a few weeks to compare.
  static const int _minWeeksForChart = 3;

  @override
  Widget build(BuildContext context) {
    final monthGroups = _groupByMonth(overview.sessions);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SectionHeader(
          title: "This Week",
          trailing: overview.currentStreakWeeks >= 2
              ? _StreakChip(weeks: overview.currentStreakWeeks)
              : null,
        ),
        const SizedBox(height: 8),
        _ThisWeekStrip(overview: overview),
        const SizedBox(height: 24),

        if (overview.recentRecords.isNotEmpty) ...[
          const _SectionHeader(title: "Recent PRs"),
          const SizedBox(height: 8),
          RecentRecordsStrip(records: overview.recentRecords),
          const SizedBox(height: 24),
        ],

        if (overview.weeklyVolume.length >= _minWeeksForChart) ...[
          WeeklyVolumeChart(
            weeks: overview.weeklyVolume,
            trendPercent: overview.volumeTrendPercent,
          ),
          const SizedBox(height: 24),
        ],

        for (final group in monthGroups) ...[
          _SectionHeader(
            title: group.label,
            trailingText: group.sessions.length == 1
                ? "1 workout"
                : "${group.sessions.length} workouts",
          ),
          const SizedBox(height: 8),
          ...group.sessions.map(
            (session) => HistorySessionCard(session: session),
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}

class _MonthGroup {
  final String label;
  final List<HistorySessionSummary> sessions;
  const _MonthGroup({required this.label, required this.sessions});
}

/// Groups sessions (already newest first) into calendar months.
List<_MonthGroup> _groupByMonth(List<HistorySessionSummary> sessions) {
  const months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December',
  ];

  final groups = <_MonthGroup>[];
  for (final session in sessions) {
    final label =
        "${months[session.endTime.month - 1]} ${session.endTime.year}";
    if (groups.isEmpty || groups.last.label != label) {
      groups.add(_MonthGroup(label: label, sessions: []));
    }
    groups.last.sessions.add(session);
  }
  return groups;
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? trailingText;
  final Widget? trailing;
  const _SectionHeader({required this.title, this.trailingText, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 14,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: Appcolors.accent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        const Spacer(),
        if (trailing != null) trailing!,
        if (trailingText != null)
          Text(
            trailingText!,
            style: const TextStyle(color: Appcolors.muteText, fontSize: 11),
          ),
      ],
    );
  }
}

/// Orange = momentum. Only shown once a real streak exists (2+ weeks).
class _StreakChip extends StatelessWidget {
  final int weeks;
  const _StreakChip({required this.weeks});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Appcolors.momentum.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.local_fire_department,
            size: 12,
            color: Appcolors.momentum,
          ),
          const SizedBox(width: 4),
          Text(
            "$weeks week streak",
            style: const TextStyle(
              color: Appcolors.momentum,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

/// What actually happened this calendar week: workouts, volume, time.
class _ThisWeekStrip extends StatelessWidget {
  final HistoryOverview overview;
  const _ThisWeekStrip({required this.overview});

  @override
  Widget build(BuildContext context) {
    final rested = overview.workoutsThisWeek == 0;

    return Row(
      children: [
        Expanded(
          child: _StatTile(
            icon: Icons.check_circle_outline,
            iconColor: rested ? Appcolors.muteText : Appcolors.success,
            value: "${overview.workoutsThisWeek}",
            label: overview.workoutsThisWeek == 1 ? "WORKOUT" : "WORKOUTS",
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _StatTile(
            icon: Icons.fitness_center,
            iconColor: rested ? Appcolors.muteText : Appcolors.info,
            value: formatCompactNumber(overview.volumeThisWeek),
            label: "LBS LIFTED",
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _StatTile(
            icon: Icons.schedule,
            iconColor: rested ? Appcolors.muteText : Appcolors.accent,
            value: _hoursMinutes(overview.secondsThisWeek),
            label: "TRAINED",
          ),
        ),
      ],
    );
  }

  String _hoursMinutes(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    if (hours > 0) return "${hours}h ${minutes}m";
    return "${minutes}m";
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const _StatTile({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 14, color: iconColor),
          const Spacer(),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Appcolors.muteText,
              fontSize: 9,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}

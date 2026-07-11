import 'package:client/core/constants/AppColors.dart';
import 'package:client/core/utils/format_number.dart';
import 'package:client/features/profile/domain/entities/lifter_stats.dart';
import 'package:client/features/profile/domain/entities/weight_unit.dart';
import 'package:client/features/profile/presentation/widgets/profile_section_header.dart';
import 'package:flutter/material.dart';

/// Lifetime totals — the numbers that only ever grow. Six chosen stats,
/// not a dashboard: enough to describe a training career at a glance.
class LifetimeStatsSection extends StatelessWidget {
  final LifterStats stats;
  final WeightUnit unit;

  const LifetimeStatsSection({
    super.key,
    required this.stats,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileSectionHeader(title: "Lifetime"),
        const SizedBox(height: 8),
        if (!stats.hasTrained)
          const _NoTrainingYetCard()
        else ...[
          Row(
            children: [
              _StatTile(
                icon: Icons.fitness_center,
                color: Appcolors.info,
                value: formatCompactNumber(unit.fromLbs(stats.totalVolumeLbs)),
                label: "${unit.label.toUpperCase()} LIFTED",
              ),
              const SizedBox(width: 8),
              _StatTile(
                icon: Icons.check_circle_outline,
                color: Appcolors.success,
                value: "${stats.totalWorkouts}",
                label: stats.totalWorkouts == 1 ? "WORKOUT" : "WORKOUTS",
              ),
              const SizedBox(width: 8),
              _StatTile(
                icon: Icons.schedule,
                color: Appcolors.accent,
                value: _hours(stats.totalSeconds),
                label: "TRAINED",
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _StatTile(
                icon: Icons.format_list_numbered,
                color: Appcolors.info,
                value: formatCompactNumber(stats.totalSets),
                label: "SETS",
              ),
              const SizedBox(width: 8),
              _StatTile(
                icon: Icons.calendar_month,
                color: Appcolors.success,
                value: stats.avgWorkoutsPerWeek.toStringAsFixed(1),
                label: "PER WEEK",
              ),
              const SizedBox(width: 8),
              _StatTile(
                icon: Icons.local_fire_department,
                color: Appcolors.momentum,
                value: "${stats.longestWeekStreak}",
                label: stats.longestWeekStreak == 1
                    ? "WEEK STREAK"
                    : "WEEKS BEST STREAK",
              ),
            ],
          ),
        ],
      ],
    );
  }

  String _hours(int seconds) {
    final hours = seconds / 3600;
    if (hours >= 10) return "${hours.round()}h";
    return "${hours.toStringAsFixed(1)}h";
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String value;
  final String label;

  const _StatTile({
    required this.icon,
    required this.color,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 76,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Appcolors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 14, color: color),
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
      ),
    );
  }
}

class _NoTrainingYetCard extends StatelessWidget {
  const _NoTrainingYetCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Appcolors.secondaryColor),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nothing lifted yet",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Your lifetime volume, training hours and streaks start "
            "counting with your first logged workout.",
            style: TextStyle(
              color: Appcolors.muteText,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

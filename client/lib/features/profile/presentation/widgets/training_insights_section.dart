import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/profile/domain/entities/lifter_stats.dart';
import 'package:client/features/profile/domain/entities/weight_unit.dart';
import 'package:client/features/profile/presentation/utils/profile_formats.dart';
import 'package:client/features/profile/presentation/widgets/profile_section_header.dart';
import 'package:flutter/material.dart';

/// What the history says about this lifter's tendencies. Each row appears
/// only when the data can actually back it — the whole section disappears
/// otherwise rather than showing empty shells.
class TrainingInsightsSection extends StatelessWidget {
  final LifterStats stats;
  final WeightUnit unit;

  const TrainingInsightsSection({
    super.key,
    required this.stats,
    required this.unit,
  });

  /// True when at least one insight row can be shown.
  static bool hasContent(LifterStats stats) =>
      stats.favoriteLift != null || stats.mostImproved != null;

  @override
  Widget build(BuildContext context) {
    final mostImproved = stats.mostImproved;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileSectionHeader(title: "Tendencies"),
        const SizedBox(height: 8),
        if (mostImproved != null)
          _InsightRow(
            icon: Icons.trending_up,
            color: Appcolors.success,
            title: "Most improved",
            value: mostImproved.exerciseName,
            detail: "est. 1RM ${formatWeight(mostImproved.firstOneRmLbs, unit)}"
                " → ${formatWeight(mostImproved.bestOneRmLbs, unit)}"
                " (+${mostImproved.percentGain.round()}%)",
          ),
        if (stats.favoriteLift != null)
          _InsightRow(
            icon: Icons.favorite_border,
            color: Appcolors.accent,
            title: "Favorite lift",
            value: stats.favoriteLift!,
            detail: "the exercise with the most completed sets",
          ),
      ],
    );
  }
}

class _InsightRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String value;
  final String detail;

  const _InsightRow({
    required this.icon,
    required this.color,
    required this.title,
    required this.value,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 16, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: const TextStyle(
                    color: Appcolors.muteText,
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  detail,
                  style: const TextStyle(
                    color: Appcolors.muteText,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

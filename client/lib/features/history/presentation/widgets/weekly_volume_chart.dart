import 'package:client/core/constants/AppColors.dart';
import 'package:client/core/utils/format_number.dart';
import 'package:client/features/history/domain/entities/history_overview.dart';
import 'package:flutter/material.dart';

/// Compact bar chart of weekly training volume with a trend indicator.
///
/// Blue = informational metric. The trend chip is the only place that turns
/// green (volume up) or red (volume down).
class WeeklyVolumeChart extends StatelessWidget {
  final List<WeeklyVolume> weeks;

  /// Percent change of the current week vs the previous average.
  final double trendPercent;

  const WeeklyVolumeChart({
    super.key,
    required this.weeks,
    required this.trendPercent,
  });

  @override
  Widget build(BuildContext context) {
    final maxVolume = weeks.fold<double>(
      0,
      (max, w) => w.volume > max ? w.volume : max,
    );

    return Container(
      width: double.infinity,
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
              const Icon(Icons.bar_chart, size: 16, color: Appcolors.info),
              const SizedBox(width: 6),
              const Text(
                "Weekly Volume",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              if (trendPercent.round() != 0)
                _TrendChip(trendPercent: trendPercent),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 72,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (var i = 0; i < weeks.length; i++) ...[
                  if (i > 0) const SizedBox(width: 6),
                  Expanded(
                    child: _Bar(
                      heightFactor: maxVolume == 0
                          ? 0
                          : weeks[i].volume / maxVolume,
                      isCurrent: i == weeks.length - 1,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                weeks.length == 2 ? "last week" : "${weeks.length - 1} wks ago",
                style: const TextStyle(
                  color: Appcolors.muteText,
                  fontSize: 10,
                ),
              ),
              Text(
                weeks.isEmpty
                    ? ""
                    : "This week · ${formatCompactNumber(weeks.last.volume)} lbs",
                style: const TextStyle(
                  color: Appcolors.muteText,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  final double heightFactor;
  final bool isCurrent;
  const _Bar({required this.heightFactor, required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: heightFactor.clamp(0.05, 1.0),
      child: Container(
        decoration: BoxDecoration(
          color: isCurrent
              ? Appcolors.info
              : Appcolors.info.withValues(alpha: 0.25),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class _TrendChip extends StatelessWidget {
  final double trendPercent;
  const _TrendChip({required this.trendPercent});

  @override
  Widget build(BuildContext context) {
    final up = trendPercent > 0;
    final color = up ? Appcolors.success : Appcolors.danger;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            up ? Icons.trending_up : Icons.trending_down,
            size: 12,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            "${up ? '+' : ''}${trendPercent.round()}% vs avg",
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

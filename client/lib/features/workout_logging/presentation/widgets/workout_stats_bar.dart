import 'package:client/core/constants/AppColors.dart';
import 'package:client/core/utils/format_number.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Live workout vitals shown at the top of the logging screen.
///
/// Three tiles carry meaning through color: duration (brand accent), volume
/// (info blue) and completed sets (success green). Only the duration tile
/// re-renders each second — it listens to [elapsedSeconds] directly, so the
/// ticking clock never rebuilds the exercise cards below it.
class WorkoutStatsBar extends StatelessWidget {
  final ValueListenable<int> elapsedSeconds;
  final double totalVolume;
  final int completedSets;

  const WorkoutStatsBar({
    super.key,
    required this.elapsedSeconds,
    required this.totalVolume,
    required this.completedSets,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ValueListenableBuilder<int>(
            valueListenable: elapsedSeconds,
            builder: (context, seconds, _) {
              return _StatTile(
                icon: Icons.timer_outlined,
                iconColor: Appcolors.accent,
                value: _clock(seconds),
                label: "DURATION",
              );
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _StatTile(
            icon: Icons.fitness_center,
            iconColor: Appcolors.info,
            value: formatCompactNumber(totalVolume),
            label: "VOLUME · LBS",
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _StatTile(
            icon: Icons.check_circle_outline,
            iconColor: completedSets == 0
                ? Appcolors.muteText
                : Appcolors.success,
            value: "$completedSets",
            label: completedSets == 1 ? "SET DONE" : "SETS DONE",
          ),
        ),
      ],
    );
  }

  /// Clock-style duration: "0:42", "12:34", "1:02:03".
  String _clock(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;
    final ss = seconds.toString().padLeft(2, '0');
    if (hours > 0) {
      final mm = minutes.toString().padLeft(2, '0');
      return "$hours:$mm:$ss";
    }
    return "$minutes:$ss";
  }
}

/// A single stat tile. Mirrors the History page's stat tile styling so the two
/// core surfaces feel like one system.
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
      height: 78,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 15, color: iconColor),
          const Spacer(),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
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

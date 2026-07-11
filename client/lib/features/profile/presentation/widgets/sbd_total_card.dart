import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/profile/domain/entities/lifter_overview.dart';
import 'package:client/features/profile/domain/entities/record_lift.dart';
import 'package:client/features/profile/domain/entities/weight_unit.dart';
import 'package:client/features/profile/presentation/utils/profile_formats.dart';
import 'package:flutter/material.dart';

/// The powerlifting total: estimated squat + bench + deadlift, its
/// bodyweight ratio, and how the three lifts balance against each other.
class SbdTotalCard extends StatelessWidget {
  final SbdTotal total;
  final WeightUnit unit;

  const SbdTotalCard({super.key, required this.total, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formatWeightValueWithCommas(total.totalLbs, unit),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  height: 1,
                ),
              ),
              const SizedBox(width: 6),
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text(
                  unit.label,
                  style: const TextStyle(
                    color: Appcolors.muteText,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Appcolors.info.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  formatRatio(total.bodyweightRatio),
                  style: const TextStyle(
                    color: Appcolors.info,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          const Text(
            "Estimated SBD total",
            style: TextStyle(color: Appcolors.muteText, fontSize: 11),
          ),
          const SizedBox(height: 14),
          _BalanceBar(total: total),
          const SizedBox(height: 10),
          Row(
            children: [
              _LegendEntry(
                lift: RecordLift.squat,
                share: total.squatShare,
                lbs: total.squatLbs,
                unit: unit,
              ),
              _LegendEntry(
                lift: RecordLift.benchPress,
                share: total.benchShare,
                lbs: total.benchLbs,
                unit: unit,
              ),
              _LegendEntry(
                lift: RecordLift.deadlift,
                share: total.deadliftShare,
                lbs: total.deadliftLbs,
                unit: unit,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// How the total splits across the three lifts. An unusually thin segment
/// is visible at a glance — that is the lift to bring up.
class _BalanceBar extends StatelessWidget {
  final SbdTotal total;
  const _BalanceBar({required this.total});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        height: 8,
        child: Row(
          children: [
            Expanded(
              flex: (total.squatShare * 1000).round(),
              child: Container(color: liftColor(RecordLift.squat)),
            ),
            const SizedBox(width: 2),
            Expanded(
              flex: (total.benchShare * 1000).round(),
              child: Container(color: liftColor(RecordLift.benchPress)),
            ),
            const SizedBox(width: 2),
            Expanded(
              flex: (total.deadliftShare * 1000).round(),
              child: Container(color: liftColor(RecordLift.deadlift)),
            ),
          ],
        ),
      ),
    );
  }
}

class _LegendEntry extends StatelessWidget {
  final RecordLift lift;
  final double share;
  final double lbs;
  final WeightUnit unit;

  const _LegendEntry({
    required this.lift,
    required this.share,
    required this.lbs,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: liftColor(lift),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _shortName,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "${formatWeightValue(lbs, unit)} · "
                  "${(share * 100).round()}%",
                  style: const TextStyle(
                    color: Appcolors.muteText,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String get _shortName {
    switch (lift) {
      case RecordLift.squat:
        return "SQUAT";
      case RecordLift.benchPress:
        return "BENCH";
      case RecordLift.deadlift:
        return "DEADLIFT";
      default:
        return lift.displayName.toUpperCase();
    }
  }
}

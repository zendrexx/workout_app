import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/profile/domain/entities/lift_record.dart';
import 'package:client/features/profile/domain/entities/lifter_overview.dart';
import 'package:client/features/profile/domain/entities/record_lift.dart';
import 'package:client/features/profile/domain/entities/weight_unit.dart';
import 'package:client/features/profile/presentation/utils/profile_formats.dart';
import 'package:client/features/profile/presentation/widgets/profile_section_header.dart';
import 'package:flutter/material.dart';

/// The lifter's best efforts. Squat, bench and deadlift always have a row —
/// a record when one exists, otherwise an invitation to earn one.
/// Supporting lifts appear only once they have real data.
class PersonalRecordsSection extends StatelessWidget {
  final LifterOverview overview;
  final VoidCallback onAddRecord;

  const PersonalRecordsSection({
    super.key,
    required this.overview,
    required this.onAddRecord,
  });

  @override
  Widget build(BuildContext context) {
    final unit = overview.profile.unit;
    final supporting = overview.supportingRecords;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileSectionHeader(title: "Personal Records"),
        const SizedBox(height: 8),
        for (final lift in RecordLift.values.where((l) => l.isCompetitionLift))
          _recordOrPlaceholder(lift, unit),
        if (supporting.isNotEmpty) ...[
          const SizedBox(height: 8),
          const Text(
            "SUPPORTING LIFTS",
            style: TextStyle(
              color: Appcolors.muteText,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 6),
          for (final record in supporting)
            _RecordCard(record: record, unit: unit),
        ],
      ],
    );
  }

  Widget _recordOrPlaceholder(RecordLift lift, WeightUnit unit) {
    final record = overview.recordFor(lift);
    if (record != null) return _RecordCard(record: record, unit: unit);
    return _MissingRecordCard(lift: lift, onAdd: onAddRecord);
  }
}

class _RecordCard extends StatelessWidget {
  final LiftRecord record;
  final WeightUnit unit;

  const _RecordCard({required this.record, required this.unit});

  @override
  Widget build(BuildContext context) {
    final color = liftColor(record.lift);
    final showOneRm = record.reps > 1;

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
            width: 3,
            height: 36,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  record.lift.displayName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  _detailLine(),
                  style: const TextStyle(
                    color: Appcolors.muteText,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (record.fromLog)
                    const Padding(
                      padding: EdgeInsets.only(right: 6),
                      child: Icon(
                        Icons.emoji_events,
                        size: 14,
                        color: Appcolors.gold,
                      ),
                    ),
                  Text(
                    formatWeightValue(
                      showOneRm ? record.estimatedOneRmLbs : record.weightLbs,
                      unit,
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      height: 1,
                    ),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    unit.label,
                    style: const TextStyle(
                      color: Appcolors.muteText,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              if (showOneRm)
                const Text(
                  "est. 1RM",
                  style: TextStyle(color: Appcolors.muteText, fontSize: 9),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String _detailLine() {
    final parts = <String>[];
    if (record.fromLog) {
      parts.add(
        "${record.reps} × ${formatWeight(record.weightLbs, unit)} logged",
      );
      final date = record.achievedAt;
      if (date != null) {
        parts.add("${date.month}/${date.day}/${date.year}");
      }
    } else {
      parts.add("entered manually");
    }
    return parts.join(" · ");
  }
}

/// No fake zeros: a missing competition lift shows what earning the record
/// takes and offers manual entry.
class _MissingRecordCard extends StatelessWidget {
  final RecordLift lift;
  final VoidCallback onAdd;

  const _MissingRecordCard({required this.lift, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Appcolors.secondaryColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lift.displayName,
                  style: const TextStyle(
                    color: Appcolors.muteText,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  "No record yet — log a heavy set or add your max",
                  style: TextStyle(color: Appcolors.muteText, fontSize: 11),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: onAdd,
            style: TextButton.styleFrom(
              foregroundColor: Appcolors.accent,
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            child: const Text("Add", style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}

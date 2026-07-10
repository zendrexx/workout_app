import 'package:client/core/constants/AppColors.dart';
import 'package:client/core/utils/format_number.dart';
import 'package:client/features/history/domain/entities/history_overview.dart';
import 'package:flutter/material.dart';

/// A horizontally scrolling strip of the user's latest personal records.
///
/// Gold is reserved for achievements, so it owns this strip. Every card here
/// is a real record pulled from a logged session — never shown when the user
/// has yet to beat an exercise.
class RecentRecordsStrip extends StatelessWidget {
  final List<RecordHighlight> records;
  const RecentRecordsStrip({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: records.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) => _RecordCard(record: records[index]),
      ),
    );
  }
}

class _RecordCard extends StatelessWidget {
  final RecordHighlight record;
  const _RecordCard({required this.record});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Appcolors.gold.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Appcolors.gold.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.emoji_events,
                  size: 14,
                  color: Appcolors.gold,
                ),
              ),
              const Spacer(),
              const Text(
                "PR",
                style: TextStyle(
                  color: Appcolors.gold,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            record.exerciseName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 2),
          Text(
            "${formatDoubleNumber(record.weight)} lbs × ${record.reps}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

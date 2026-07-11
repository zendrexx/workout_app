import 'package:client/core/constants/AppColors.dart';
import 'package:client/core/utils/format_number.dart';
import 'package:client/core/utils/seconds_to_string.dart';
import 'package:client/features/history/domain/entities/history_overview.dart';
import 'package:flutter/material.dart';

/// One completed workout in the history timeline. Tapping expands the card
/// in place to reveal each exercise's best set — no navigation needed.
///
/// Color carries meaning here: green marks the workout as completed, gold
/// marks records earned during this session. Everything else stays neutral.
class HistorySessionCard extends StatefulWidget {
  final HistorySessionSummary session;
  const HistorySessionCard({super.key, required this.session});

  @override
  State<HistorySessionCard> createState() => _HistorySessionCardState();
}

class _HistorySessionCardState extends State<HistorySessionCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final session = widget.session;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //const _CompletedMark(),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            session.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            _subtitle(session),
                            style: const TextStyle(
                              color: Appcolors.muteText,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (session.recordCount > 0)
                      _RecordChip(count: session.recordCount),
                    const SizedBox(width: 8),
                    AnimatedRotation(
                      turns: _expanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: const Icon(
                        Icons.expand_more,
                        size: 20,
                        color: Appcolors.muteText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      _SessionFact(
                        value:
                            "${formatCompactNumber(session.totalVolume)} lbs",
                        label: "volume",
                      ),
                      _factDivider(),
                      _SessionFact(
                        value: "${session.completedSets}",
                        label: session.completedSets == 1 ? "set" : "sets",
                      ),
                      _factDivider(),
                      _SessionFact(
                        value: "${session.exerciseCount}",
                        label: session.exerciseCount == 1
                            ? "exercise"
                            : "exercises",
                      ),
                    ],
                  ),
                ),
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 200),
                  crossFadeState: _expanded && session.exercises.isNotEmpty
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  firstChild: const SizedBox(width: double.infinity),
                  secondChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Container(height: 1, color: Appcolors.secondaryColor),
                      const SizedBox(height: 12),
                      for (final exercise in session.exercises) ...[
                        _ExerciseRow(exercise: exercise),
                        if (exercise != session.exercises.last)
                          const SizedBox(height: 10),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _subtitle(HistorySessionSummary session) {
    final date = _friendlyDate(session.endTime);
    if (session.durationSeconds <= 0) return date;
    return "$date · ${secondsToString(session.durationSeconds)}";
  }

  Widget _factDivider() {
    return Container(
      width: 1,
      height: 20,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      color: Appcolors.secondaryColor,
    );
  }
}

/// "Today", "Yesterday", or "Tue, Jul 8" — real dates, no vague scores.
String _friendlyDate(DateTime dateTime) {
  const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  const months = [
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

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final day = DateTime(dateTime.year, dateTime.month, dateTime.day);
  final difference = today.difference(day).inDays;

  if (difference == 0) return "Today";
  if (difference == 1) return "Yesterday";

  final base =
      "${weekdays[dateTime.weekday - 1]}, ${months[dateTime.month - 1]} ${dateTime.day}";
  if (dateTime.year != now.year) return "$base, ${dateTime.year}";
  return base;
}

/// Green check: this workout was completed. Green is reserved for done.
class _CompletedMark extends StatelessWidget {
  const _CompletedMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Appcolors.accent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.check,
        size: 16,
        color: Appcolors.backgroundColor,
      ),
    );
  }
}

/// Gold: records earned during this specific session.
class _RecordChip extends StatelessWidget {
  final int count;
  const _RecordChip({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: Appcolors.gold.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.emoji_events_outlined,
            size: 10,
            color: Appcolors.gold,
          ),
          const SizedBox(width: 3),
          Text(
            count == 1 ? "1 PR" : "$count PRs",
            style: const TextStyle(
              color: Appcolors.gold,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _SessionFact extends StatelessWidget {
  final String value;
  final String label;
  const _SessionFact({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(color: Appcolors.muteText, fontSize: 11),
        ),
      ],
    );
  }
}

class _ExerciseRow extends StatelessWidget {
  final SessionExerciseSummary exercise;
  const _ExerciseRow({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      exercise.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  if (exercise.isRecord) ...[
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.emoji_events,
                      size: 12,
                      color: Appcolors.gold,
                    ),
                  ],
                ],
              ),
            ),
            Text(
              "${exercise.completedSets} ${exercise.completedSets == 1 ? 'set' : 'sets'}",
              style: const TextStyle(color: Appcolors.muteText, fontSize: 12),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 76,
              child: Text(
                "${formatDoubleNumber(exercise.topWeight)} × ${exercise.topReps}",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: exercise.isRecord ? Appcolors.gold : Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        if (exercise.hasNotes) ...[
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.notes, size: 12, color: Appcolors.muteText),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  exercise.notes.trim(),
                  style: const TextStyle(
                    color: Appcolors.muteText,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

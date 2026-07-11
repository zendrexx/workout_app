import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/workout_planning/presentation/state/planned_set_state.dart';
import 'package:flutter/material.dart';

/// Read-only exercise card for viewing a planned session. Mirrors the visual
/// language of ExerciseLogCard (the logging screen's exercise card) so a
/// saved session looks like the workout it will produce — just without any
/// editable fields, progress or completion state.
class ViewExerciseCard extends StatelessWidget {
  final String title;
  final String? equipment;
  final String imagePath;
  final List<PlannedSetState> plannedSets;
  final String? notes;

  const ViewExerciseCard({
    super.key,
    required this.title,
    this.equipment,
    required this.imagePath,
    required this.plannedSets,
    this.notes,
  });

  String _repRange(PlannedSetState set) {
    return set.minRep == set.maxRep
        ? "${set.minRep}"
        : "${set.minRep}-${set.maxRep}";
  }

  String _weight(PlannedSetState set) {
    if (set.estWeight <= 0) return "—";
    return set.estWeight % 1 == 0
        ? set.estWeight.toInt().toString()
        : set.estWeight.toString();
  }

  bool get _hasNotes =>
      notes != null && notes!.trim().isNotEmpty && notes != "null";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.04)),
      ),
      child: Column(
        children: [
          _header(),
          if (_hasNotes) _notes(),
          const SizedBox(height: 6),
          _columnHeaders(),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: List.generate(
                plannedSets.length,
                (index) => _setRow(index),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Appcolors.secondaryColor,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (equipment != null && equipment!.trim().isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    equipment!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Appcolors.muteText,
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Appcolors.secondaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "${plannedSets.length} sets",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _notes() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.sticky_note_2_outlined,
            size: 15,
            color: Appcolors.muteText,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              notes!,
              style: const TextStyle(fontSize: 13, color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  Widget _columnHeaders() {
    const style = TextStyle(
      fontSize: 11,
      color: Appcolors.muteText,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    );
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text("SET", style: style, textAlign: TextAlign.center),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Text("LBS", style: style, textAlign: TextAlign.center),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Text("REPS", style: style, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  Widget _setRow(int index) {
    final set = plannedSets[index];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                width: 26,
                height: 26,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Appcolors.secondaryColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "${index + 1}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Text(
              _weight(set),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Text(
              _repRange(set),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

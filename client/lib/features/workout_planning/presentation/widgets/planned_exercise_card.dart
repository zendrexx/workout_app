import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/workout_planning/presentation/providers/planned_session_view_model_provider.dart';
import 'package:client/features/workout_planning/presentation/state/planned_set_state.dart';
import 'package:client/features/workout_planning/presentation/viewmodel/planned_session_viewmodel.dart';
import 'package:client/features/workout_planning/presentation/widgets/planned_set_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// One exercise while building a session — the planning mirror of the logging
/// exercise card. Same carded look (image + name header, note, column headers,
/// set rows, in-card "Add set"), but no live stats or completion state since
/// nothing is being performed yet.
class PlannedExerciseCard extends ConsumerStatefulWidget {
  final String title;
  final String? equipment;
  final String imagePath;
  final int exerciseIndex;
  final String? notes;
  final List<PlannedSetState> sets;

  const PlannedExerciseCard({
    super.key,
    required this.title,
    this.equipment,
    required this.imagePath,
    required this.exerciseIndex,
    required this.sets,
    this.notes,
  });

  @override
  ConsumerState<PlannedExerciseCard> createState() =>
      _PlannedExerciseCardState();
}

class _PlannedExerciseCardState extends ConsumerState<PlannedExerciseCard> {
  late final TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    final existing = widget.notes;
    _notesController = TextEditingController(
      text: (existing != null && existing.isNotEmpty && existing != "null")
          ? existing
          : "",
    );
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  String _formatNumber(num value) =>
      value % 1 == 0 ? value.toInt().toString() : value.toString();

  String? _repRange(int? minRep, int? maxRep) {
    if (minRep == null && maxRep == null) return null;
    if (minRep == maxRep) return minRep.toString();
    return '$minRep-$maxRep';
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.read(plannedSessionViewModelProvider.notifier);
    final sets = widget.sets;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.04)),
      ),
      child: Column(
        children: [
          _header(context, vm, sets.length),
          _notesField(vm),
          const SizedBox(height: 4),
          _columnHeaders(),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPlRowInset),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: sets.length,
              itemBuilder: (context, setIndex) {
                final set = sets[setIndex];
                return PlannedSetRow(
                  key: ValueKey('${widget.exerciseIndex}-$setIndex'),
                  setIndex: setIndex,
                  exerciseIndex: widget.exerciseIndex,
                  estWeight: _formatNumber(set.estWeight),
                  repRange: _repRange(set.minRep, set.maxRep),
                );
              },
            ),
          ),
          _addSetButton(vm),
        ],
      ),
    );
  }

  Widget _header(BuildContext context, PlannedSessionViewmodel vm, int setCount) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 14, 6, 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Appcolors.secondaryColor,
            backgroundImage: AssetImage(widget.imagePath),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (widget.equipment != null &&
                    widget.equipment!.trim().isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    widget.equipment!,
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
          _setCountPill(setCount),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _showOptions(context, vm),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.more_vert, color: Appcolors.muteText, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _setCountPill(int setCount) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Appcolors.secondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        setCount == 1 ? "1 set" : "$setCount sets",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _notesField(PlannedSessionViewmodel vm) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 4, 14, 0),
      child: Row(
        children: [
          const Icon(Icons.sticky_note_2_outlined,
              size: 15, color: Appcolors.muteText),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _notesController,
              cursorColor: Colors.white,
              style: const TextStyle(fontSize: 13, color: Colors.white70),
              minLines: 1,
              maxLines: 3,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 4),
                hintText: "Add a note…",
                hintStyle: TextStyle(fontSize: 13, color: Appcolors.muteText),
                border: InputBorder.none,
              ),
              onChanged: (value) =>
                  vm.addNotesToExercise(widget.exerciseIndex, value),
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
    const centered = TextAlign.center;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPlRowInset),
      child: Row(
        children: const [
          Expanded(
            flex: kPlSetColFlex,
            child: Text("SET", style: style, textAlign: centered),
          ),
          SizedBox(width: kPlColumnGap),
          Expanded(
            flex: kPlWeightColFlex,
            child: Text("LBS", style: style, textAlign: centered),
          ),
          SizedBox(width: kPlColumnGap),
          Expanded(
            flex: kPlRepColFlex,
            child: Text("REP RANGE", style: style, textAlign: centered),
          ),
        ],
      ),
    );
  }

  Widget _addSetButton(PlannedSessionViewmodel vm) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Material(
        color: Appcolors.secondaryColor,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => vm.addSetToExercise(widget.exerciseIndex),
          child: Container(
            height: 40,
            alignment: Alignment.center,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, size: 16, color: Colors.white70),
                SizedBox(width: 6),
                Text(
                  "Add Set",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showOptions(BuildContext context, PlannedSessionViewmodel vm) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Appcolors.primaryColor,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Appcolors.secondaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 8),
              ListTile(
                leading: const Icon(Icons.swap_horiz, color: Colors.white),
                title: const Text(
                  "Replace Exercise",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "Swap this for a different exercise",
                  style: TextStyle(color: Appcolors.muteText),
                ),
                onTap: () {
                  Navigator.pop(sheetContext);
                  context.push(
                    "/home/create_sessions/update_exercise/${widget.exerciseIndex}",
                    extra: plannedSessionViewModelProvider,
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.delete_outline,
                  color: Appcolors.danger,
                ),
                title: const Text(
                  "Delete Exercise",
                  style: TextStyle(color: Appcolors.danger),
                ),
                subtitle: const Text(
                  "Remove this exercise from the session",
                  style: TextStyle(color: Appcolors.muteText),
                ),
                onTap: () {
                  Navigator.pop(sheetContext);
                  vm.deleteExercise(widget.exerciseIndex);
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}

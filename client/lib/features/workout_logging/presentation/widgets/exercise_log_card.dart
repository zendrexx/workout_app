import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/workout_logging/presentation/providers/workout_logging_view_model_provider.dart';
import 'package:client/features/workout_logging/presentation/state/performed_set_state.dart';
import 'package:client/features/workout_logging/presentation/viewmodel/workout_logging_view_model.dart';
import 'package:client/features/workout_logging/presentation/widgets/performed_set_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// One exercise while logging a workout. A self-contained card so the eye can
/// tell where each exercise begins and ends: image + name header, a live
/// completion bar, an optional note, column headers and the set rows, with an
/// in-card "Add set" affordance.
class ExerciseLogCard extends ConsumerStatefulWidget {
  final String title;
  final String? equipment;
  final String imagePath;
  final int index;
  final List<PerformedSetState> plannedSets;
  final String? notes;

  const ExerciseLogCard({
    super.key,
    required this.title,
    this.equipment,
    required this.imagePath,
    required this.index,
    required this.plannedSets,
    this.notes,
  });

  @override
  ConsumerState<ExerciseLogCard> createState() => _ExerciseLogCardState();
}

class _ExerciseLogCardState extends ConsumerState<ExerciseLogCard> {
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

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(workoutLoggingViewModelProvider.notifier);
    final sets = widget.plannedSets;
    final completed = sets.where((s) => s.isCompleted).length;
    final total = sets.length;
    final allDone = total > 0 && completed == total;
    final progress = total == 0 ? 0.0 : completed / total;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: allDone
              ? Appcolors.success.withValues(alpha: 0.35)
              : Colors.white.withValues(alpha: 0.04),
        ),
      ),
      child: Column(
        children: [
          _header(context, completed, total, allDone),
          _progressBar(progress, allDone),
          _notesField(vm),
          const SizedBox(height: 4),
          _columnHeaders(vm, allDone),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kRowHorizontalInset,
            ),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: sets.length,
              itemBuilder: (context, setIndex) {
                final set = sets[setIndex];
                return PerformedSetRow(
                  key: ValueKey(
                    '${widget.index}-$setIndex-${set.isCompleted}',
                  ),
                  setIndex: setIndex,
                  index: widget.index,
                  estWeight: _formatNumber(set.estWeight),
                  repRange: set.estRep,
                  isCompleted: set.isCompleted,
                  actRep: set.actRep,
                  actWeight: set.actWeight,
                  actRpe: set.actRpe,
                );
              },
            ),
          ),
          _addSetButton(vm),
        ],
      ),
    );
  }

  Widget _header(
    BuildContext context,
    int completed,
    int total,
    bool allDone,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 14, 6, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          _progressPill(completed, total, allDone),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _showOptions(context),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.more_vert, color: Appcolors.muteText, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _progressPill(int completed, int total, bool allDone) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: allDone
            ? Appcolors.success.withValues(alpha: 0.15)
            : Appcolors.secondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (allDone) ...[
            const Icon(Icons.check_circle, size: 12, color: Appcolors.success),
            const SizedBox(width: 4),
          ],
          Text(
            "$completed/$total",
            style: TextStyle(
              color: allDone ? Appcolors.success : Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _progressBar(double progress, bool allDone) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Stack(
          children: [
            Container(height: 4, color: Appcolors.secondaryColor),
            AnimatedFractionallySizedBox(
              duration: const Duration(milliseconds: 260),
              curve: Curves.easeOut,
              widthFactor: progress.clamp(0.0, 1.0),
              child: Container(height: 4, color: Appcolors.success),
            ),
          ],
        ),
      ),
    );
  }

  Widget _notesField(WorkoutLoggingViewModel vm) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                  vm.addNotesToExercise(widget.index, value),
            ),
          ),
        ],
      ),
    );
  }

  Widget _columnHeaders(WorkoutLoggingViewModel vm, bool allDone) {
    const style = TextStyle(
      fontSize: 11,
      color: Appcolors.muteText,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    );
    const centered = TextAlign.center;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kRowHorizontalInset),
      child: Row(
        children: [
          const Expanded(
            flex: kSetColFlex,
            child: Text("SET", style: style, textAlign: centered),
          ),
          const SizedBox(width: kColumnGap),
          const Expanded(
            flex: kWeightColFlex,
            child: Text("LBS", style: style, textAlign: centered),
          ),
          const SizedBox(width: kColumnGap),
          const Expanded(
            flex: kRepsColFlex,
            child: Text("REPS", style: style, textAlign: centered),
          ),
          const SizedBox(width: kColumnGap),
          const Expanded(
            flex: kRpeColFlex,
            child: Text("RPE", style: style, textAlign: centered),
          ),
          const SizedBox(width: kColumnGap),
          SizedBox(
            width: kCheckColWidth,
            child: Align(
              alignment: Alignment.centerRight,
              child: Checkbox(
                value: allDone,
                onChanged: (value) {
                  if (value == true) {
                    vm.completeAllSets(widget.index);
                  } else {
                    vm.uncompleteAllSets(widget.index);
                  }
                },
                fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.selected)) {
                    return Appcolors.success;
                  }
                  return Colors.transparent;
                }),
                checkColor: Colors.white,
                side: const BorderSide(color: Appcolors.muteText, width: 1.5),
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _addSetButton(WorkoutLoggingViewModel vm) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Material(
        color: Appcolors.secondaryColor,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => vm.addSetToExercise(widget.index),
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

  void _showOptions(BuildContext context) {
    final vm = ref.read(workoutLoggingViewModelProvider.notifier);
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Appcolors.primaryColor,
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
                leading: const Icon(Icons.refresh, color: Colors.white),
                title: const Text(
                  "Replace Exercise",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "Swap this out for a different exercise",
                  style: TextStyle(color: Appcolors.muteText),
                ),
                onTap: () {
                  Navigator.pop(sheetContext);
                  context.push(
                    "/home/create_sessions/update_exercise/${widget.index}",
                    extra: workoutLoggingViewModelProvider,
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
                  "Remove this exercise from the workout",
                  style: TextStyle(color: Appcolors.muteText),
                ),
                onTap: () {
                  Navigator.pop(sheetContext);
                  vm.deleteExercise(widget.index);
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

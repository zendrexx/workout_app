import 'package:client/core/constants/AppColors.dart';
import 'package:client/core/utils/format_number.dart';
import 'package:client/features/workout_logging/presentation/providers/rest_timer_provider.dart';
import 'package:client/features/workout_logging/presentation/providers/workout_logging_view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

/// Shared column layout so the set rows line up perfectly under the card's
/// column headers. Both sides use these same constants and the same single
/// [kRowHorizontalInset] — no other horizontal padding is added anywhere
/// else, which is what keeps them pixel-aligned.
const int kSetColFlex = 16;
const int kWeightColFlex = 30;
const int kRepsColFlex = 22;
const int kRpeColFlex = 20;
const double kCheckColWidth = 40;
const double kColumnGap = 8;
const double kRowHorizontalInset = 16;

/// A single logged set: number, weight, reps, RPE and a completion check.
/// Completing a set is the app's core micro-reward — it animates to a
/// success state, fires a haptic tick and kicks off the rest timer.
class PerformedSetRow extends ConsumerStatefulWidget {
  final int setIndex;
  final int index;
  final String? estWeight;
  final String? repRange;
  final bool isCompleted;
  final int actRep;
  final double actWeight;
  final double? actRpe;

  const PerformedSetRow({
    super.key,
    required this.setIndex,
    required this.index,
    this.estWeight,
    this.repRange,
    this.isCompleted = false,
    this.actRep = 0,
    this.actWeight = 0,
    this.actRpe,
  });

  @override
  ConsumerState<PerformedSetRow> createState() => _PerformedSetRowState();
}

class _PerformedSetRowState extends ConsumerState<PerformedSetRow> {
  late final TextEditingController weightController;
  late final TextEditingController repController;
  late final TextEditingController rpeController;

  bool isDone = false;
  bool _weightError = false;
  bool _repsError = false;

  @override
  void initState() {
    super.initState();
    isDone = widget.isCompleted;
    weightController = TextEditingController(
      text: widget.actWeight > 0
          ? formatDoubleNumber(widget.actWeight)
          : (widget.estWeight != null && widget.estWeight != "0"
                ? widget.estWeight
                : ""),
    );
    repController = TextEditingController(
      text: widget.actRep > 0 ? widget.actRep.toString() : "",
    );
    rpeController = TextEditingController(
      text: widget.actRpe != null ? formatDoubleNumber(widget.actRpe!) : "",
    );
  }

  @override
  void dispose() {
    weightController.dispose();
    repController.dispose();
    rpeController.dispose();
    super.dispose();
  }

  String _hint(String? value) {
    if (value == null || value.isEmpty || value == "null" || value == "0") {
      return "—";
    }
    return value;
  }

  void _toggleComplete(bool? value) {
    final vm = ref.read(workoutLoggingViewModelProvider.notifier);
    final wantsComplete = value ?? false;

    if (wantsComplete) {
      final weightEmpty = weightController.text.trim().isEmpty;
      final repsEmpty = repController.text.trim().isEmpty;
      if (weightEmpty || repsEmpty) {
        setState(() {
          _weightError = weightEmpty;
          _repsError = repsEmpty;
        });
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Appcolors.secondaryColor,
              duration: Duration(seconds: 2),
              content: Text(
                "Enter weight and reps before completing this set",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        return;
      }

      final weight = double.tryParse(weightController.text) ?? 0.0;
      final reps = int.tryParse(repController.text) ?? 0;

      setState(() {
        isDone = true;
        _weightError = false;
        _repsError = false;
      });

      vm.addWeightToSets(
        widget.index,
        widget.setIndex,
        formatDoubleNumber(weight),
      );
      vm.addRepRangeToSets(widget.index, widget.setIndex, reps.toString());
      vm.isSetCompleted(widget.index, widget.setIndex);
      vm.addStats(weight, reps);

      HapticFeedback.lightImpact();
      ref.read(restTimerProvider.notifier).start();
    } else {
      final weight = double.tryParse(weightController.text) ?? 0.0;
      final reps = int.tryParse(repController.text) ?? 0;
      setState(() => isDone = false);
      vm.isSetCompleted(widget.index, widget.setIndex);
      vm.removeStats(weight, reps);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.read(workoutLoggingViewModelProvider.notifier);

    return Slidable(
      key: ValueKey('${widget.index}-${widget.setIndex}'),
      endActionPane: ActionPane(
        extentRatio: 0.22,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => vm.deleteSet(widget.index, widget.setIndex),
            backgroundColor: Appcolors.danger,
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.circular(8),
            icon: Icons.delete_outline,
          ),
        ],
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.symmetric(vertical: 3),
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: isDone
              ? Appcolors.success.withValues(alpha: 0.10)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border(
            left: BorderSide(
              color: isDone ? Appcolors.success : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(flex: kSetColFlex, child: _setBadge()),
            const SizedBox(width: kColumnGap),
            Expanded(
              flex: kWeightColFlex,
              child: _numberField(
                controller: weightController,
                hint: _hint(widget.estWeight),
                hasError: _weightError,
                allowDecimal: true,
                onChanged: (v) {
                  if (_weightError && v.trim().isNotEmpty) {
                    setState(() => _weightError = false);
                  }
                  vm.addWeightToSets(widget.index, widget.setIndex, v);
                },
              ),
            ),
            const SizedBox(width: kColumnGap),
            Expanded(
              flex: kRepsColFlex,
              child: _numberField(
                controller: repController,
                hint: _hint(widget.repRange),
                hasError: _repsError,
                allowDecimal: false,
                onChanged: (v) {
                  if (_repsError && v.trim().isNotEmpty) {
                    setState(() => _repsError = false);
                  }
                  vm.addRepRangeToSets(widget.index, widget.setIndex, v);
                },
              ),
            ),
            const SizedBox(width: kColumnGap),
            Expanded(
              flex: kRpeColFlex,
              child: _numberField(
                controller: rpeController,
                hint: "—",
                hasError: false,
                allowDecimal: true,
                onChanged: (v) =>
                    vm.addRpeToSets(widget.index, widget.setIndex, v),
              ),
            ),
            const SizedBox(width: kColumnGap),
            SizedBox(
              width: kCheckColWidth,
              child: Align(
                alignment: Alignment.centerRight,
                child: _checkBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _setBadge() {
    // Centered explicitly: inside an Expanded, the incoming width constraint
    // is tight, which would otherwise stretch this fixed 26x26 circle into an
    // oval spanning the whole column.
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 180),
        transitionBuilder: (child, anim) =>
            ScaleTransition(scale: anim, child: child),
        child: Container(
          key: ValueKey(isDone),
          width: 26,
          height: 26,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isDone
                ? Appcolors.success.withValues(alpha: 0.18)
                : Appcolors.secondaryColor,
            shape: BoxShape.circle,
          ),
          child: isDone
              ? const Icon(Icons.check, size: 15, color: Appcolors.success)
              : Text(
                  "${widget.setIndex + 1}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _numberField({
    required TextEditingController controller,
    required String hint,
    required bool hasError,
    required bool allowDecimal,
    required ValueChanged<String> onChanged,
  }) {
    return TextField(
      controller: controller,
      readOnly: isDone,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.numberWithOptions(decimal: allowDecimal),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          allowDecimal ? RegExp(r'[0-9.]') : RegExp(r'[0-9]'),
        ),
      ],
      onChanged: onChanged,
      cursorColor: Colors.white,
      style: TextStyle(
        fontSize: 15,
        fontWeight: isDone ? FontWeight.w700 : FontWeight.w500,
        color: isDone ? Appcolors.success : Colors.white,
      ),
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 15,
          color: Appcolors.muteText,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        filled: true,
        fillColor: isDone
            ? Colors.transparent
            : Appcolors.secondaryColor.withValues(alpha: 0.5),
        border: _fieldBorder(hasError),
        enabledBorder: _fieldBorder(hasError),
        focusedBorder: _fieldBorder(hasError),
      ),
    );
  }

  OutlineInputBorder _fieldBorder(bool hasError) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: hasError
          ? const BorderSide(color: Appcolors.danger, width: 1)
          : BorderSide.none,
    );
  }

  Widget _checkBox() {
    return Checkbox(
      value: isDone,
      onChanged: _toggleComplete,
      fillColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) return Appcolors.success;
        return Colors.transparent;
      }),
      checkColor: Colors.white,
      side: const BorderSide(color: Appcolors.muteText, width: 1.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}

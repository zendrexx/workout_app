import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/workout_planning/presentation/providers/planned_session_view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

/// Shared column layout so planned set rows line up under the card's column
/// headers. Both use these constants and the same [kPlRowInset] — nothing
/// else adds horizontal padding, which keeps them pixel-aligned.
const int kPlSetColFlex = 16;
const int kPlWeightColFlex = 34;
const int kPlRepColFlex = 34;
const double kPlColumnGap = 8;
const double kPlRowInset = 16;

/// A single planned set: number badge, target weight and target rep range.
/// This is the planning mirror of the logging set row — no completion check,
/// no RPE, just the prescription the user will later perform.
class PlannedSetRow extends ConsumerStatefulWidget {
  final int setIndex;
  final int exerciseIndex;
  final String? estWeight;
  final String? repRange;

  const PlannedSetRow({
    super.key,
    required this.setIndex,
    required this.exerciseIndex,
    this.estWeight,
    this.repRange,
  });

  @override
  ConsumerState<PlannedSetRow> createState() => _PlannedSetRowState();
}

class _PlannedSetRowState extends ConsumerState<PlannedSetRow> {
  late final TextEditingController weightController;
  late final TextEditingController repRangeController;

  @override
  void initState() {
    super.initState();
    weightController = TextEditingController(text: _clean(widget.estWeight));
    repRangeController = TextEditingController(text: _clean(widget.repRange));
  }

  @override
  void dispose() {
    weightController.dispose();
    repRangeController.dispose();
    super.dispose();
  }

  String _clean(String? value) {
    if (value == null || value.isEmpty || value == "null" || value == "0") {
      return "";
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.read(plannedSessionViewModelProvider.notifier);

    return Slidable(
      key: ValueKey('${widget.exerciseIndex}-${widget.setIndex}'),
      endActionPane: ActionPane(
        extentRatio: 0.22,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (_) =>
                vm.deleteSet(widget.exerciseIndex, widget.setIndex),
            backgroundColor: Appcolors.danger,
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.circular(8),
            icon: Icons.delete_outline,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Expanded(flex: kPlSetColFlex, child: _setBadge()),
            const SizedBox(width: kPlColumnGap),
            Expanded(
              flex: kPlWeightColFlex,
              child: _numberField(
                controller: weightController,
                hint: "—",
                allowDash: false,
                onChanged: (v) => vm.addWeightToSets(
                  widget.exerciseIndex,
                  widget.setIndex,
                  v,
                ),
              ),
            ),
            const SizedBox(width: kPlColumnGap),
            Expanded(
              flex: kPlRepColFlex,
              child: _numberField(
                controller: repRangeController,
                hint: "8-10",
                allowDash: true,
                onChanged: (v) => vm.addRepRangeToSets(
                  widget.exerciseIndex,
                  widget.setIndex,
                  v,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _setBadge() {
    // Centered explicitly: inside an Expanded the width constraint is tight,
    // which would otherwise stretch this fixed circle into an oval.
    return Center(
      child: Container(
        width: 26,
        height: 26,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Appcolors.secondaryColor,
          shape: BoxShape.circle,
        ),
        child: Text(
          "${widget.setIndex + 1}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _numberField({
    required TextEditingController controller,
    required String hint,
    required bool allowDash,
    required ValueChanged<String> onChanged,
  }) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          allowDash ? RegExp(r'[0-9\-]') : RegExp(r'[0-9.]'),
        ),
      ],
      onChanged: onChanged,
      cursorColor: Colors.white,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 15, color: Appcolors.muteText),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        filled: true,
        fillColor: Appcolors.secondaryColor.withValues(alpha: 0.5),
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
      ),
    );
  }

  OutlineInputBorder get _border => OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: BorderSide.none,
  );
}

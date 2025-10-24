import 'package:client/core/notifier/temp_session_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutSetWidget extends ConsumerStatefulWidget {
  final int setNum;
  final int index;
  const WorkoutSetWidget({
    super.key,
    required this.setNum,
    required this.index,
  });

  @override
  ConsumerState<WorkoutSetWidget> createState() => _WorkoutSetWidgetState();
}

class _WorkoutSetWidgetState extends ConsumerState<WorkoutSetWidget> {
  void addWeight(WidgetRef ref, String weight) {
    // Convert safely to double
    final double? rweight = double.tryParse(weight);
    if (rweight == null) return;

    // Convert the set number to int (since it's a String like "1")

    ref
        .read(tempSessionProvider.notifier)
        .addWeightToSets(widget.index, widget.setNum, rweight);
  }

  void addRepRange(WidgetRef ref, String repRange) {
    ref
        .read(tempSessionProvider.notifier)
        .addRepRangeToSets(widget.index, widget.setNum, repRange);
  }

  @override
  void dispose() {
    weightController.dispose();
    repRangeController.dispose();
    super.dispose();
  }

  late TextEditingController weightController = TextEditingController();
  late TextEditingController repRangeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              (widget.setNum + 1).toString(),
              style: TextStyle(fontSize: 14),
            ),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
              ],
              onChanged: (value) {
                addWeight(ref, value);
              },
              decoration: InputDecoration(
                hintText: "-",
                isDense: true, // makes it smaller vertically
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 0,
                ),
                border: InputBorder.none, // removes the underline
                focusedBorder:
                    InputBorder.none, // removes underline when focused
                enabledBorder:
                    InputBorder.none, // removes underline when enabled
              ),
              style: TextStyle(fontSize: 14), // makes text smaller
              textAlign: TextAlign.start,
              cursorColor: Colors.white,
            ),
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {
                addRepRange(ref, value);
              },
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9\-]')),
              ],
              decoration: InputDecoration(
                hintText: "-",
                isDense: true, // makes it smaller vertically
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 0,
                ),
                border: InputBorder.none, // removes the underline
                focusedBorder:
                    InputBorder.none, // removes underline when focused
                enabledBorder:
                    InputBorder.none, // removes underline when enabled
              ),
              style: TextStyle(fontSize: 14), // makes text smaller
              textAlign: TextAlign.start,
              cursorColor: Colors.white,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

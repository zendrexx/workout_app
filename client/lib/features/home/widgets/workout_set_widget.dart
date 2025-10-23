import 'package:client/core/notifier/temp_session_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutSetWidget extends ConsumerStatefulWidget {
  final String setNum;
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
    final double rweight = weight as double;
    final int setIndex = widget.setNum as int;

    ref
        .read(tempSessionProvider.notifier)
        .addWeightToSets(widget.index, setIndex - 1, rweight);
  }

  void addRepRange(WidgetRef ref, String repRange) {
    final int setIndex = widget.setNum as int;

    ref
        .read(tempSessionProvider.notifier)
        .addRepRangeToSets(widget.index, setIndex - 1, repRange);
  }

  late TextEditingController weightController = TextEditingController();
  late TextEditingController repRangeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          Expanded(child: Text(widget.setNum, style: TextStyle(fontSize: 14))),
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

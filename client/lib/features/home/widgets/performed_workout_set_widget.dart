import 'package:client/core/notifier/temp_session_notifier.dart';
import 'package:client/core/notifier/temp_workout_stats.dart';
import 'package:client/data/models/planned_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PerformedWorkoutSetWidget extends ConsumerStatefulWidget {
  final int setNum;
  final int index;

  final String? estWeight;
  final String? repRange;
  const PerformedWorkoutSetWidget({
    super.key,
    required this.setNum,
    required this.index,

    this.estWeight,
    this.repRange,
  });

  @override
  ConsumerState<PerformedWorkoutSetWidget> createState() =>
      _PerformedWorkoutSetWidgetState();
}

class _PerformedWorkoutSetWidgetState
    extends ConsumerState<PerformedWorkoutSetWidget> {
  late TextEditingController weightController = TextEditingController();
  late TextEditingController repController = TextEditingController();

  String estweight = '-';
  String reprange = '-';
  bool isDone = false;
  String normalizeValue(String? value) {
    if (value == null || value == "null" || value.isEmpty) {
      return "-";
    }
    return value;
  }

  void addStats(double lbs, int reps) {
    ref.read(tempWorkoutStatsProvider.notifier).addStats(lbs, reps);
  }

  void removeStats(double lbs, int reps) {
    ref.read(tempWorkoutStatsProvider.notifier).removeStats(lbs, reps);
  }

  @override
  void initState() {
    super.initState();
    if (widget.estWeight != null ||
        widget.estWeight != "null" ||
        widget.estWeight!.isNotEmpty) {
      weightController.text = widget.estWeight!;
    } else {
      weightController.text = "";
    }
    reprange = normalizeValue(widget.repRange);
  }

  void addActWeight(WidgetRef ref, String weight) {
    // Convert safely to double
    final double? rweight = double.tryParse(weight);
    if (rweight == null) return;

    // Convert the set number to int (since it's a String like "1")

    ref
        .read(tempSessionProvider.notifier)
        .addActWeightToSets(widget.index, widget.setNum, rweight);
  }

  void addActRep(WidgetRef ref, String actRep) {
    final int? iActRep = int.tryParse(actRep);
    if (iActRep == null) return;
    ref
        .read(tempSessionProvider.notifier)
        .addActRepToSets(widget.index, widget.setNum, iActRep);
  }

  @override
  void dispose() {
    weightController.dispose();
    repController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDone ? Color(0xff18341B) : Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  readOnly: true,
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
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
              Expanded(
                child: TextField(
                  controller: weightController,
                  readOnly: isDone,
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
                  ],
                  onChanged: (value) {
                    addActWeight(ref, value);
                  },
                  decoration: InputDecoration(
                    hintText: estweight,
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
                  controller: repController,
                  readOnly: isDone,
                  onChanged: (value) {
                    addActRep(ref, value);
                  },
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: InputDecoration(
                    hintText: reprange,
                    isDense: true, // makes it smaller vertically
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 0,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.start,
                  cursorColor: Colors.white,
                ),
              ),
              Expanded(
                child: Checkbox(
                  fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Color(0xff27B82C); // green when checked
                    }
                    return Colors.transparent; // grey when unchecked
                  }),
                  checkColor: Colors.white,
                  value: isDone,
                  onChanged: (bool? value) {
                    setState(() => isDone = value ?? false);
                    final double weight =
                        double.tryParse(weightController.text) ?? 0.0;
                    final int reps = int.tryParse(repController.text) ?? 0;
                    if (isDone) {
                      addStats(weight, reps);
                    } else {
                      removeStats(weight, reps);
                    }
                  },
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

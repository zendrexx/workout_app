import 'package:client/core/utils/format_number.dart';
import 'package:client/features/workout_logging/presentation/providers/workout_logging_view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PerformedWorkoutSetWidget extends ConsumerStatefulWidget {
  final int setIndex;
  final int index;
  final String? estWeight;
  final String? repRange;
  final bool isCompleted;
  final int actRep;
  final double actWeight;
  //final String? previousWeight;
  const PerformedWorkoutSetWidget({
    super.key,
    required this.setIndex,
    required this.index,
    //this.previousWeight,
    this.estWeight,
    this.repRange,
    this.isCompleted = false,
    this.actRep = 0,
    this.actWeight = 0,
  });

  @override
  ConsumerState<PerformedWorkoutSetWidget> createState() =>
      _PerformedWorkoutSetWidgetState();
}

class _PerformedWorkoutSetWidgetState
    extends ConsumerState<PerformedWorkoutSetWidget> {
  bool weightEmpty = false;
  bool repsEmpty = false;
  late TextEditingController weightController = TextEditingController();
  late TextEditingController repController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String previousWeight = '-';
  String estweight = '-';
  String reprange = '-';
  bool isDone = false;
  String normalizeValue(String? value) {
    if (value == null || value == "null" || value.isEmpty) {
      return "-";
    }
    return value;
  }

  @override
  void initState() {
    super.initState();
    isDone = widget.isCompleted;

    // Weight starts from the actual (if already logged) or the planned estimate.
    weightController.text = widget.actWeight > 0
        ? formatDoubleNumber(widget.actWeight)
        : (widget.estWeight ?? "");

    // Reps: the planned target is only a hint; the user types the actual reps.
    reprange = normalizeValue(widget.repRange);
    repController.text = widget.actRep > 0 ? widget.actRep.toString() : "";
  }

  @override
  void dispose() {
    weightController.dispose();
    repController.dispose();
    super.dispose();
  }
  //  return Slidable(
  //       key: ValueKey('${widget.index}-${widget.setNum}'),

  //       enabled: !widget.viewing, // disable swipe when viewing

  @override
  Widget build(BuildContext context) {
    final vm = ref.read(workoutLoggingViewModelProvider.notifier);
    return Form(
      key: _formKey,
      child: Slidable(
        key: ValueKey(widget.setIndex),
        endActionPane: ActionPane(
          extentRatio: 0.10,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
                vm.deleteSet(widget.index, widget.setIndex);
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
            ),
          ],
        ),
        child: Padding(
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
                      (widget.setIndex + 1).toString(),
                      style: TextStyle(fontSize: 14),
                    ),
                  ),

                  // Expanded(
                  //   child: TextField(
                  //     readOnly: true,
                  //     keyboardType: TextInputType.numberWithOptions(
                  //       decimal: true,
                  //       signed: true,
                  //     ),
                  //     inputFormatters: [
                  //       FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
                  //     ],

                  //     decoration: InputDecoration(
                  //       hintText: "-",
                  //       isDense: true, // makes it smaller vertically
                  //       contentPadding: EdgeInsets.symmetric(
                  //         vertical: 0,
                  //         horizontal: 0,
                  //       ),
                  //       border: InputBorder.none, // removes the underline
                  //       focusedBorder:
                  //           InputBorder.none, // removes underline when focused
                  //       enabledBorder:
                  //           InputBorder.none, // removes underline when enabled
                  //     ),
                  //     style: TextStyle(fontSize: 14), // makes text smaller
                  //     textAlign: TextAlign.start,
                  //     cursorColor: Colors.white,
                  //   ),
                  // ),
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
                        vm.addWeightToSets(
                          widget.index,
                          widget.setIndex,
                          value,
                        );
                      },
                      decoration: InputDecoration(
                        hintText: estweight,
                        isDense: true, // makes it smaller vertically
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 0,
                        ), //dk
                        border: InputBorder.none, // removes the underline
                        focusedBorder:
                            InputBorder.none, // removes underline when focused
                        enabledBorder: weightEmpty
                            ? UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                              )
                            : InputBorder.none,

                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),

                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),

                        errorStyle: const TextStyle(height: 0),
                      ),
                      style: TextStyle(fontSize: 14), // makes text smaller
                      textAlign: TextAlign.start,
                      cursorColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      controller: repController,
                      readOnly: isDone,
                      onChanged: (value) {
                        vm.addRepRangeToSets(
                          widget.index,
                          widget.setIndex,
                          value,
                        );
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
                        enabledBorder: repsEmpty
                            ? UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                              )
                            : InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.start,
                      cursorColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Checkbox(
                        fillColor: WidgetStateProperty.resolveWith<Color>((
                          states,
                        ) {
                          if (states.contains(WidgetState.selected)) {
                            return Color(0xff27B82C); // green when checked
                          }
                          return Colors.transparent; // grey when unchecked
                        }),
                        checkColor: Colors.white,
                        value: isDone,
                        onChanged: (bool? value) {
                        weightEmpty = weightController.text.isEmpty;
                        repsEmpty = repController.text.isEmpty;
                        if (weightEmpty) {
                          setState(() {});
                        } else if (repsEmpty) {
                          setState(() {});
                        } else {
                          setState(() => isDone = value ?? false);
                          final double weight =
                              double.tryParse(weightController.text) ?? 0.0;
                          final int reps =
                              int.tryParse(repController.text) ?? 0;
                          if (isDone) {
                            print("WEIGHT");
                            print(weight);
                            vm.addWeightToSets(
                              widget.index,
                              widget.setIndex,
                              formatDoubleNumber(weight),
                            );

                            vm.isSetCompleted(widget.index, widget.setIndex);
                            vm.addStats(weight, reps);
                          } else {
                            vm.removeStats(weight, reps);
                          }
                        }
                      },
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

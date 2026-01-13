import 'package:client/features/workout_planning/presentation/providers/planned_session_view_model_provider.dart';
import 'package:client/features/workout_planning/presentation/viewmodel/planned_session_viewmodel.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutSetWidget extends ConsumerStatefulWidget {
  final int setNum;
  final int index;
  final bool viewing;
  final String? estWeight;
  final String? repRange;
  const WorkoutSetWidget({
    super.key,
    required this.setNum,
    required this.index,
    this.viewing = false,
    this.estWeight,
    this.repRange,
  });

  @override
  ConsumerState<WorkoutSetWidget> createState() => _WorkoutSetWidgetState();
}

class _WorkoutSetWidgetState extends ConsumerState<WorkoutSetWidget> {
  late TextEditingController weightController = TextEditingController();
  late TextEditingController repRangeController = TextEditingController();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        weightController.text =
            (widget.estWeight == null ||
                widget.estWeight == 'null' ||
                widget.estWeight!.isEmpty ||
                widget.estWeight == '0')
            ? ''
            : widget.estWeight!;
        repRangeController.text =
            (widget.repRange == null ||
                widget.repRange == 'null' ||
                widget.repRange!.isEmpty ||
                widget.estWeight == '0')
            ? ''
            : widget.repRange!;
      });
    });
  }

  // void addWeight(WidgetRef ref, String weight) {
  //   // Convert safely to double
  //   final double? rweight = double.tryParse(weight);
  //   if (rweight == null) return;

  //   // Convert the set number to int (since it's a String like "1")
  // }

  void addRepRange(WidgetRef ref, String repRange) {
    // ref
    //     .read(tempSessionProvider.notifier)
    //     .addRepRangeToSets(widget.index, widget.setNum, repRange);
  }

  @override
  void dispose() {
    weightController.dispose();
    repRangeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.read(plannedSessionViewModelProvider.notifier);
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
              controller: weightController,
              enabled: !widget.viewing,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
              ],
              onChanged: (value) {
                vm.addRepRangeToSets(widget.index, widget.setNum, value);
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
              controller: repRangeController,
              enabled: !widget.viewing,
              onChanged: (value) {
                vm.addWeightToSets(widget.index, widget.setNum, value);
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

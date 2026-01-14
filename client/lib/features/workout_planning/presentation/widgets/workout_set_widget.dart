import 'package:client/features/workout_planning/presentation/providers/planned_session_view_model_provider.dart';
import 'package:client/features/workout_planning/presentation/viewmodel/planned_session_viewmodel.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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

    return Slidable(
      key: ValueKey('${widget.index}-${widget.setNum}'),

      enabled: !widget.viewing, // disable swipe when viewing

      endActionPane: ActionPane(
        extentRatio: 0.10,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              vm.deleteSet(widget.index, widget.setNum);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Row(
          children: [
            Expanded(
              child: Text(
                (widget.setNum + 1).toString(),
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              child: TextField(
                controller: weightController,
                enabled: !widget.viewing,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
                ],
                onChanged: (value) {
                  vm.addWeightToSets(widget.index, widget.setNum, value);
                },
                decoration: const InputDecoration(
                  hintText: "-",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: 14),
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
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9\-]')),
                ],
                decoration: const InputDecoration(
                  hintText: "-",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: 14),
                cursorColor: Colors.white,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

import 'package:client/features/workout_planning/presentation/state/planned_set_state.dart';
import 'package:client/features/workout_planning/presentation/widgets/workout_set_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewSessionWorkoutWidget extends ConsumerStatefulWidget {
  final String title;
  final String? equipment;
  final String imagePath;
  final int exerciseIndex;
  final List<PlannedSetState> plannedSets;
  final String? notes;
  const ViewSessionWorkoutWidget({
    required this.title,
    this.equipment,
    required this.imagePath,
    required this.exerciseIndex,
    super.key,
    required this.plannedSets,
    this.notes,
  });

  @override
  ConsumerState<ViewSessionWorkoutWidget> createState() =>
      _ViewSessionWorkoutWidgetState();
}

class _ViewSessionWorkoutWidgetState
    extends ConsumerState<ViewSessionWorkoutWidget> {
  String? plannedRepRange(int index) {
    String? repRange;

    if (widget.plannedSets[index].minRep == widget.plannedSets[index].maxRep) {
      repRange = widget.plannedSets[index].minRep.toString();
    } else {
      repRange =
          '${widget.plannedSets[index].minRep}-${widget.plannedSets[index].maxRep}';
    }

    return repRange;
  }

  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();

    if (widget.notes != null) {
      _controller.text = widget.notes!;
    }
    // print(widget.plannedSets);
  }

  @override
  Widget build(BuildContext context) {
    final sets = widget.plannedSets;

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(widget.imagePath),
              ),
              const SizedBox(width: 5),
              Text(
                widget.title,
                style: const TextStyle(
                  color: Color(0xffE2725B),
                  fontSize: 16,
                  wordSpacing: .5,
                ),
              ),
              if (widget.equipment != null)
                Text(
                  " (${widget.equipment})",
                  style: const TextStyle(
                    color: Color(0xffE2725B),
                    fontSize: 16,
                    wordSpacing: .5,
                  ),
                ),
              const Spacer(),
            ],
          ),
          TextField(
            enabled: false,
            controller: _controller,
            style: const TextStyle(fontSize: 14, color: Colors.white),
            decoration: InputDecoration(
              hintText: "Notes here",
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 14, color: Colors.white24),
            ),
            cursorColor: Colors.white,
          ),
          Row(
            children: const [
              Expanded(
                child: Text(
                  "SETS",
                  style: TextStyle(fontSize: 12, color: Color(0xffA1A1AA)),
                ),
              ),
              Expanded(
                child: Text(
                  "LBS",
                  style: TextStyle(fontSize: 12, color: Color(0xffA1A1AA)),
                ),
              ),
              Expanded(
                child: Text(
                  "REP RANGE",
                  style: TextStyle(fontSize: 12, color: Color(0xffA1A1AA)),
                ),
              ),
              Spacer(),
            ],
          ),
          const SizedBox(height: 5),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: sets.length,
            itemBuilder: (context, setIndex) {
              return WorkoutSetWidget(
                setIndex: setIndex,
                exerciseIndex: widget.exerciseIndex,
                estWeight: (sets[setIndex].estWeight % 1 == 0
                    ? sets[setIndex].estWeight.toInt().toString()
                    : sets[setIndex].estWeight.toString()),

                repRange: plannedRepRange(setIndex),
                viewing: true,
              );
            },
          ),
        ],
      ),
    );
  }
}

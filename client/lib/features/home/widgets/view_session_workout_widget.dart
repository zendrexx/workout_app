import 'package:client/core/notifier/planned_session_stream_provider.dart';
import 'package:client/core/notifier/temp_session_notifier.dart';
import 'package:client/data/models/planned_set.dart';
import 'package:client/features/home/widgets/workout_set_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ViewSessionWorkoutWidget extends ConsumerStatefulWidget {
  final String title;
  final String? equipment;
  final String imagePath;
  final int index;
  final int id;
  final List<PlannedSet> plannedSets;
  const ViewSessionWorkoutWidget({
    required this.title,
    this.equipment,
    required this.imagePath,
    required this.index,
    required this.id,
    super.key,
    required this.plannedSets,
  });

  @override
  ConsumerState<ViewSessionWorkoutWidget> createState() =>
      _ViewSessionWorkoutWidgetState();
}

class _ViewSessionWorkoutWidgetState
    extends ConsumerState<ViewSessionWorkoutWidget> {
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
          const TextField(
            enabled: false,
            decoration: InputDecoration(
              hintText: "Add notes here",
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 14),
            ),
            cursorColor: Colors.white,
          ),
          Row(
            children: const [
              Expanded(
                child: Text(
                  "SETS",
                  style: TextStyle(fontSize: 12, color: Color(0xff4E4E50)),
                ),
              ),
              Expanded(
                child: Text(
                  "LBS",
                  style: TextStyle(fontSize: 12, color: Color(0xff4E4E50)),
                ),
              ),
              Expanded(
                child: Text(
                  "REP RANGE",
                  style: TextStyle(fontSize: 12, color: Color(0xff4E4E50)),
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
              return WorkoutSetWidget(setNum: setIndex, index: widget.index);
            },
          ),
        ],
      ),
    );
  }
}

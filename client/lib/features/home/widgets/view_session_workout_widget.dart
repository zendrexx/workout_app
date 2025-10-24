import 'package:client/core/notifier/temp_session_notifier.dart';
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
  const ViewSessionWorkoutWidget({
    required this.title,
    this.equipment,
    required this.imagePath,
    required this.index,
    required this.id,
    super.key,
  });

  @override
  ConsumerState<ViewSessionWorkoutWidget> createState() =>
      _ViewSessionWorkoutWidgetState();
}

class _ViewSessionWorkoutWidgetState
    extends ConsumerState<ViewSessionWorkoutWidget> {
  @override
  Widget build(BuildContext context) {
    final session = ref.watch(tempSessionProvider);
    final sets = session.plannedExercise[widget.index].sets;
    final plannedSet = ref.watch(tempSessionProvider);

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
              SizedBox(width: 5),
              Row(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Color(0xffE2725B),
                      fontSize: 16,
                      wordSpacing: .5,
                    ),
                  ),
                  Text(
                    widget.equipment != null ? " (${widget.equipment})" : "",
                    style: TextStyle(
                      color: Color(0xffE2725B),
                      fontSize: 16,
                      wordSpacing: .5,
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
          TextField(
            enabled: false,
            //controller: notesController,
            decoration: InputDecoration(
              hintText: "Add notes here",
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 14),
            ),
            cursorColor: Colors.white,
          ),
          Row(
            children: [
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
          SizedBox(height: 5),

          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, setIndex) {
              return WorkoutSetWidget(setNum: setIndex, index: widget.index);
            }),
            itemCount: sets.length,
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}

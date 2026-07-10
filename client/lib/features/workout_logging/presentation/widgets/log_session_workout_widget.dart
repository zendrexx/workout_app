import 'package:client/features/workout_logging/presentation/providers/workout_logging_view_model_provider.dart';
import 'package:client/features/workout_logging/presentation/state/performed_set_state.dart';
import 'package:client/features/home/presentation/widgets/long_custom_button.dart';
import 'package:client/features/workout_logging/presentation/widgets/performed_workout_set_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LogSessionWorkoutWidget extends ConsumerStatefulWidget {
  final String title;
  final String? equipment;
  final String imagePath;
  final int index;
  final List<PerformedSetState> plannedSets;
  final String? notes;
  const LogSessionWorkoutWidget({
    required this.title,
    this.equipment,
    required this.imagePath,
    required this.index,
    super.key,
    required this.plannedSets,
    this.notes,
  });

  @override
  ConsumerState<LogSessionWorkoutWidget> createState() =>
      _LogSessionWorkoutWidgetState();
}

class _LogSessionWorkoutWidgetState
    extends ConsumerState<LogSessionWorkoutWidget> {
  String formatNumber(num value) {
    if (value % 1 == 0) {
      return value.toInt().toString(); // 10.0 → "10"
    } else {
      return value.toString(); // 10.5 → "10.5"
    }
  }

  TextEditingController _controller = TextEditingController();
  String? note;
  @override
  void initState() {
    super.initState();
    if (widget.notes != null &&
        widget.notes!.isNotEmpty &&
        widget.notes != "null") {
      _controller.text = widget.notes!;
    }
    note = "Add notes here";
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(workoutLoggingViewModelProvider.notifier);
    final sets = widget.plannedSets;
    final allDone = sets.isNotEmpty && sets.every((s) => s.isCompleted);

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
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
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 200,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: Container(
                                  width: 100,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                ),
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: Color(0xff2A2A2A),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                            context.push(
                                              "/home/create_sessions/update_exercise/${widget.index}",
                                              extra:
                                                  workoutLoggingViewModelProvider,
                                            );
                                          },
                                          behavior: HitTestBehavior.opaque,
                                          child: Row(
                                            children: [
                                              SizedBox(width: 10),
                                              Text(
                                                "Replace Exercise",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(thickness: .2),
                                      Expanded(
                                        child: GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            vm.deleteExercise(widget.index);

                                            Navigator.pop(context);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(width: 10),
                                              Text(
                                                "Delete Exercise",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff9A1A1A),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      backgroundColor: Color(0xff131313),
                      useRootNavigator: true,
                    );
                  },
                  child: Icon(Icons.more_vert_outlined, color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: note,
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 14, color: Colors.white24),
              ),
              cursorColor: Colors.white,
              onChanged: (value) => vm.addNotesToExercise(widget.index, value),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "SET",
                    style: TextStyle(fontSize: 12, color: Color(0xff4E4E50)),
                  ),
                ),
                const Expanded(
                  child: Text(
                    "LBS",
                    style: TextStyle(fontSize: 12, color: Color(0xff4E4E50)),
                  ),
                ),
                const SizedBox(width: 5),
                const Expanded(
                  child: Text(
                    "REPS",
                    style: TextStyle(fontSize: 12, color: Color(0xff4E4E50)),
                  ),
                ),
                // Master checkbox: complete / uncomplete every set at once.
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Checkbox(
                      value: allDone,
                      onChanged: (value) {
                        if (value == true) {
                          vm.completeAllSets(widget.index);
                        } else {
                          vm.uncompleteAllSets(widget.index);
                        }
                      },
                      fillColor: WidgetStateProperty.resolveWith<Color>((
                        states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return const Color(0xff27B82C);
                        }
                        return Colors.transparent;
                      }),
                      checkColor: Colors.white,
                      side: const BorderSide(color: Color(0xff4E4E50)),
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: sets.length,
            itemBuilder: (context, setIndex) {
              final set = widget.plannedSets[setIndex];
              return PerformedWorkoutSetWidget(
                // Rebuild the row fresh when its completion flips (e.g. via the
                // master checkbox) so it reflects the new state and actuals.
                key: ValueKey('${widget.index}-$setIndex-${set.isCompleted}'),
                setIndex: setIndex,
                index: widget.index,
                estWeight: formatNumber(set.estWeight),
                repRange: set.estRep,
                isCompleted: set.isCompleted,
                actRep: set.actRep,
                actWeight: set.actWeight,
              );
            },
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: LongCustomButton(
              title: "+ Add Sets",
              onTap: () {
                vm.addSetToExercise(widget.index);
              },
              Bcolor: Color(0xff242727),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

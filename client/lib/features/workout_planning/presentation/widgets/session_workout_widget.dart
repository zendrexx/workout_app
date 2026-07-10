import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/workout_planning/presentation/providers/planned_session_view_model_provider.dart';
import 'package:client/features/workout_planning/presentation/viewmodel/planned_session_viewmodel.dart';
import 'package:client/features/home/presentation/widgets/long_custom_button.dart';
import 'package:client/features/workout_planning/presentation/state/planned_set_state.dart';
import 'package:client/features/workout_planning/presentation/widgets/workout_set_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SessionWorkoutWidget extends ConsumerStatefulWidget {
  final String title;
  final String? equipment;
  final String imagePath;
  final int exerciseIndex;
  final String? note;
  const SessionWorkoutWidget({
    super.key,
    required this.title,
    this.equipment,
    required this.imagePath,
    required this.exerciseIndex,
    this.note,
  });

  @override
  ConsumerState<SessionWorkoutWidget> createState() =>
      _SessionWorkoutWidgetState();
}

class _SessionWorkoutWidgetState extends ConsumerState<SessionWorkoutWidget> {
  late TextEditingController notesController = TextEditingController();
  @override
  void initState() {
    super.initState();

    notesController.text = widget.note ?? "";
  }

  void _showExerciseOptions(BuildContext context, PlannedSessionViewmodel vm) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Appcolors.primaryColor,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.swap_horiz, color: Colors.white),
                title: const Text(
                  "Replace Exercise",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "Swap this for a different exercise",
                  style: TextStyle(color: Appcolors.muteText),
                ),
                onTap: () {
                  Navigator.pop(sheetContext);
                  context.push(
                    "/home/create_sessions/update_exercise/${widget.exerciseIndex}",
                    extra: plannedSessionViewModelProvider,
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.delete_outline,
                  color: Color(0xffE2725B),
                ),
                title: const Text(
                  "Delete Exercise",
                  style: TextStyle(color: Color(0xffE2725B)),
                ),
                subtitle: const Text(
                  "Remove this exercise from the session",
                  style: TextStyle(color: Appcolors.muteText),
                ),
                onTap: () {
                  Navigator.pop(sheetContext);
                  vm.deleteExercise(widget.exerciseIndex);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String? plannedRepRange(int index, int? minRep, int? maxRep) {
    String? repRange;

    if (minRep == maxRep) {
      repRange = minRep.toString();
    } else {
      repRange = '$minRep-$maxRep';
    }
    return repRange;
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.read(plannedSessionViewModelProvider.notifier);
    final sets = ref.watch(
      plannedSessionViewModelProvider.select((state) {
        if (widget.exerciseIndex >= state.exercises.length) {
          return <PlannedSetState>[];
        }
        return state.exercises[widget.exerciseIndex].sets;
      }),
    );

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
              GestureDetector(
                onTap: () => _showExerciseOptions(context, vm),
                child: Icon(Icons.more_vert_outlined, color: Colors.white),
              ),
            ],
          ),
          TextField(
            controller: notesController,
            decoration: InputDecoration(
              hintText: "Add notes here",
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 14),
            ),
            cursorColor: Colors.white,
            onChanged: (value) {
              vm.addNotesToExercise(widget.exerciseIndex, value);
            },
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
              return WorkoutSetWidget(
                setIndex: setIndex,
                exerciseIndex: widget.exerciseIndex,
                estWeight: (sets[setIndex].estWeight % 1 == 0
                    ? sets[setIndex].estWeight.toInt().toString()
                    : sets[setIndex].estWeight.toString()),

                repRange: plannedRepRange(
                  setIndex,
                  sets[setIndex].minRep,
                  sets[setIndex].maxRep,
                ),

                key: ValueKey(setIndex),
              );
            }),
            itemCount: sets.length,
            shrinkWrap: true,
          ),
          SizedBox(height: 10),
          LongCustomButton(
            title: "+ Add Sets",
            onTap: () {
              vm.addSetToExercise(widget.exerciseIndex);
            },
            Bcolor: Color(0xff242727),
          ),
        ],
      ),
    );
  }
}

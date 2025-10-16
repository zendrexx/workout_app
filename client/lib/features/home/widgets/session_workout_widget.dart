import 'package:client/core/notifier/temp_session_notifier.dart';
import 'package:client/data/model_temp/temp_planned_sets.dart';
import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/planned_set.dart';
import 'package:client/features/history/widgets/workout_row_widget.dart';
import 'package:client/features/home/widgets/long_custom_button.dart';
import 'package:client/features/home/widgets/workout_set_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SessionWorkoutWidget extends ConsumerWidget {
  final String title;
  final String? equipment;
  final String imagePath;
  final int index;
  final int id;
  const SessionWorkoutWidget({
    super.key,
    required this.title,
    this.equipment,
    required this.imagePath,
    required this.index,
    required this.id,
  });

  void deleteExercise(WidgetRef ref, int index) {
    ref.read(tempSessionProvider.notifier).deleteExercise(index);
  }

  void addSets(WidgetRef ref, TempPlannedSets value) {
    ref.watch(tempSessionProvider.notifier).addSetToExercise(index, value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(tempSessionProvider);
    final sets = session.plannedExercise[index].sets;
    final plannedSet = ref.watch(tempSessionProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(radius: 20, backgroundImage: AssetImage(imagePath)),
              SizedBox(width: 5),
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xffE2725B),
                      fontSize: 16,
                      wordSpacing: .5,
                    ),
                  ),
                  Text(
                    equipment != null ? " ($equipment)" : "",
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
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 300,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            child: Container(
                              height: 150,
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
                                          "/home/create_sessions/update_exercise/$index",
                                        );
                                      },
                                      behavior: HitTestBehavior.opaque,
                                      child: Center(
                                        child: Text(
                                          "Replace Exercise",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                  Expanded(
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        deleteExercise(ref, index);
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Text(
                                          "Delete Exercise",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff9A1A1A),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
          TextField(
            decoration: InputDecoration(
              hintText: "Add notes here",
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 14),
            ),
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
              return WorkoutSetWidget(setNum: (setIndex + 1).toString());
            }),
            itemCount: sets.length,
            shrinkWrap: true,
          ),
          SizedBox(height: 10),
          LongCustomButton(
            title: "+ Add Sets",
            onTap: () {
              TempPlannedSets sets = TempPlannedSets();
              addSets(ref, sets);
            },
            Bcolor: Color(0xff242727),
          ),
        ],
      ),
    );
  }
}

import 'package:client/features/workout_planning/presentation/state/planned_exercise_state.dart';
import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';
import 'package:client/features/workout_program/presentation/providers/program_view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionCardWidget extends ConsumerStatefulWidget {
  final bool isSelectable;
  final bool isSelected;

  final VoidCallback? onTap;
  final String sessionName;
  final List<PlannedExerciseState> exercises;
  final String? sessionId;
  final int? index;

  const SessionCardWidget({
    super.key,
    this.isSelectable = false,
    this.isSelected = false,
    this.onTap,
    required this.sessionName,
    required this.exercises,
    this.sessionId,
    this.index,
  });

  @override
  ConsumerState<SessionCardWidget> createState() => _SessionCardWidgetState();
}

class _SessionCardWidgetState extends ConsumerState<SessionCardWidget> {
  String exerciseList = "";
  @override
  void didUpdateWidget(covariant SessionCardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.exercises != widget.exercises) {
      exerciseList = widget.exercises
          .map((ex) => '${ex.exerciseName} (${ex.equipment})')
          .join(', ');
    }
  }

  @override
  Widget build(BuildContext context) {
    final exerciseList = widget.exercises
        .map((ex) => '${ex.exerciseName} (${ex.equipment})')
        .join(', ');
    final vm = ref.watch(programViewModelProvider.notifier);
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: GestureDetector(
        onTap: widget.isSelectable ? null : widget.onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: widget.isSelected
                  ? const Color(0xffE2725B)
                  : const Color(0xff4E4A43),
            ),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: Row(
              children: [
                // if (widget.isSelected) ...[
                //   Container(
                //     width: 5,
                //     decoration: BoxDecoration(
                //       color: const Color(0xffE2725B),
                //       borderRadius: BorderRadius.circular(5),
                //     ),
                //   ),
                //   const SizedBox(width: 20),
                // ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.sessionName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            widget.isSelectable
                                ? const SizedBox.shrink()
                                : GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return SizedBox(
                                            height: 200,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                      ),
                                                  child: Container(
                                                    width: 100,
                                                    height: 5,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            5,
                                                          ),
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 15),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 24.0,
                                                      ),
                                                  child: Container(
                                                    height: 120,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xff2A2A2A),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            5,
                                                          ),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Expanded(
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              vm.duplicateSession(
                                                                widget
                                                                    .sessionId!,
                                                              );
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                            },
                                                            behavior:
                                                                HitTestBehavior
                                                                    .opaque,
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "Duplicate Session",
                                                                  style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Divider(thickness: .2),
                                                        Expanded(
                                                          child: GestureDetector(
                                                            behavior:
                                                                HitTestBehavior
                                                                    .opaque,
                                                            onTap: () {
                                                              vm.deleteProgramSessionAt(
                                                                widget.index!,
                                                              );
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "Delete Session",
                                                                  style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Color(
                                                                      0xff9A1A1A,
                                                                    ),
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
                                    child: Icon(
                                      Icons.more_horiz_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                          ],
                        ),
                      ),

                      // Description
                      Text(exerciseList, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

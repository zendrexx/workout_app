import 'dart:async';

import 'package:client/core/notifier/planned_session_stream_provider.dart';
import 'package:client/features/workout_logging/presentation/providers/workout_logging_view_model_provider.dart';
import 'package:client/features/workout_planning/presentation/viewmodel/planned_session_viewmodel.dart';
import 'package:client/features/workout_planning/presentation/viewmodel/temp_workout_stats.dart';
import 'package:client/data/repositories/planned_session_repo.dart';
import 'package:client/features/workout_logging/presentation/widgets/log_session_workout_widget.dart';
import 'package:client/features/workout_logging/presentation/widgets/log_workout_detail_widget.dart';
import 'package:client/features/home/presentation/widgets/long_custom_button.dart';
import 'package:client/features/home/presentation/widgets/session_card_widget.dart';
import 'package:client/features/workout_planning/presentation/widgets/view_session_workout_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LogWorkoutPage extends ConsumerStatefulWidget {
  final String? sessionId;
  const LogWorkoutPage({super.key, required this.sessionId});

  @override
  ConsumerState<LogWorkoutPage> createState() => _LogWorkoutPageState();
}

class _LogWorkoutPageState extends ConsumerState<LogWorkoutPage> {
  Timer? _timer;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
    ref
        .read(workoutLoggingViewModelProvider.notifier)
        .loadPlannedSessionToLogging(widget.sessionId!);
    // var save = SaveToTemp(ref: ref);
    // save.convertToTemp(widget.sessionId!);
  }

  String formatVolume(double volume) {
    return volume % 1 == 0
        ? volume
              .toInt()
              .toString() // if whole number, show as int
        : volume.toStringAsFixed(1); // if has decimal, keep 1 decimal
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void cancel() {
    context.push('/home');
    // ref.invalidate(tempSessionProvider);
  }

  String _formatDuration(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    if (hours > 0) {
      return "${hours}h ${minutes}m ${seconds}s";
    } else if (minutes > 0) {
      return "${minutes}m ${seconds}s";
    } else {
      return "${seconds}s";
    }
  }

  void addSession() async {
    // final tempSession = ref.read(tempSessionProvider);
    // final tempStats = ref.read(tempWorkoutStatsProvider);
    // await saveLogSession(tempSession, tempStats, ref);

    // ref.invalidate(tempSessionProvider);
    // ref.invalidate(tempWorkoutStatsProvider);

    // Navigator.pop(context);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(workoutLoggingViewModelProvider);
    final workoutStats = ref.watch(tempWorkoutStatsProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Log Workout",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: const Color(0xff0F0F0F),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => cancel(),
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Color(0xffE2725B)),
                ),
              ),
              SizedBox(width: 16),
              GestureDetector(
                onTap: () => addSession(),
                child: Text("Finish", style: TextStyle(color: Colors.white)),
              ),

              SizedBox(width: 16),
            ],
          ),
        ],
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.8),
        scrolledUnderElevation: 6,
        surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: Color(0xff0F0F0F),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    SizedBox(width: 5),
                    LogWorkoutDetailWidget(
                      title: "Duration",
                      color: Color(0xff3C6996),
                      value: _formatDuration(_seconds),
                    ),
                    LogWorkoutDetailWidget(
                      title: "Volume",
                      value: formatVolume(workoutStats.tempTotalVolume ?? 0),
                    ),
                    LogWorkoutDetailWidget(
                      title: "Sets",
                      value: (workoutStats.tempTotalSets ?? 0).toString(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(thickness: .4),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.performedExercise.length,

                    itemBuilder: (context, index) {
                      final current = state.performedExercise[index];
                      return LogSessionWorkoutWidget(
                        title: current.exerciseName,
                        equipment: current.equipment,
                        imagePath: current.imagePath,
                        index: index,
                        plannedSets: current.sets,
                        notes: current.notes,
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: LongCustomButton(
                  title: "+ Add Exercises",
                  onTap: () => context.push(
                    "/home/create_sessions/add_exercise",
                    extra: workoutLoggingViewModelProvider,
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

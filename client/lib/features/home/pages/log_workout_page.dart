import 'dart:async';

import 'package:client/core/notifier/planned_session_stream_provider.dart';
import 'package:client/data/services/planned_session_service.dart';
import 'package:client/features/home/widgets/log_workout_detail_widget.dart';
import 'package:client/features/home/widgets/long_custom_button.dart';
import 'package:client/features/home/widgets/session_card_widget.dart';
import 'package:client/features/home/widgets/view_session_workout_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LogWorkoutPage extends ConsumerStatefulWidget {
  final int id;
  const LogWorkoutPage({super.key, required this.id});

  @override
  ConsumerState<LogWorkoutPage> createState() => _LogWorkoutPageState();
}

class _LogWorkoutPageState extends ConsumerState<LogWorkoutPage> {
  final sesService = PlannedSessionService();
  Timer? _timer;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
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

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final plannedSessionsAsync = ref.watch(plannedSessionStreamProvider);
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
                onTap: () => context.push('/home'),
                child: Text(
                  "Finish",
                  style: TextStyle(color: Color(0xffE2725B)),
                ),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: 5),
                  LogWorkoutDetailWidget(
                    title: "Duration",
                    color: Color(0xff3C6996),
                    value: _formatDuration(_seconds),
                  ),
                  LogWorkoutDetailWidget(title: "Volume"),
                  LogWorkoutDetailWidget(title: "Sets"),
                ],
              ),
              Divider(thickness: .4),
              plannedSessionsAsync.when(
                data: (sessions) {
                  final session = sessions.firstWhere((s) => s.id == widget.id);
                  final exercises = session.plannedExercise.toList();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: exercises.length,
                        itemBuilder: (context, index) {
                          return ViewSessionWorkoutWidget(
                            title: exercises[index].exerciseName ?? '',
                            equipment: exercises[index].equipment ?? '',
                            imagePath: exercises[index].exercisePath ?? '',
                            index: index,
                            exerciseId: exercises[index].id,
                            plannedSets: exercises[index].sets.toList(),
                            notes: exercises[index].notes,
                          );
                        },
                      ),
                    ],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Text(
                  'Error: $err',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

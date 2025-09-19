import 'package:client/features/history/widgets/history_workout_container_widget.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            HistoryWorkoutContainerWidget(),
            HistoryWorkoutContainerWidget(),
          ],
        ),
      ),
    );
  }
}

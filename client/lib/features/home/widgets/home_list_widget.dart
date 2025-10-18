import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/planned_exercise.dart';
import 'package:client/data/services/planned_session_service.dart';
import 'package:client/features/home/widgets/long_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeListWidget extends StatelessWidget {
  final Function fOntap;
  final String title;
  final int id;
  final List<PlannedExercise> exercises;
  HomeListWidget({
    super.key,
    required this.fOntap,
    required this.id,
    required this.title,
    required this.exercises,
  });
  final sesService = PlannedSessionService();
  @override
  Widget build(BuildContext context) {
    final exerciseName = exercises
        .map((p) => p.exercise.value?.name ?? "Unnamed Exercise")
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff3B4141)),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: TextStyle(fontSize: 16)),
                    IconButton(
                      onPressed: () {
                        sesService.deleteSession(id);
                        print("tappedd");
                      },
                      padding: EdgeInsets.zero, // removes default padding
                      constraints: BoxConstraints(), // removes extra space
                      icon: Icon(Icons.delete, size: 20, color: Colors.white),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: exerciseName.length,
                  itemBuilder: (context, index) {
                    return Text(exerciseName[index].toString());

                    //print(exerciseName[index].toString() + " exercise\n");
                  },
                ),
                SizedBox(height: 10),
                LongCustomButton(title: "Session", onTap: () => fOntap),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

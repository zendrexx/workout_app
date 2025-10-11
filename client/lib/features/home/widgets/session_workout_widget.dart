import 'package:client/features/history/widgets/workout_row_widget.dart';
import 'package:client/features/home/widgets/long_custom_button.dart';
import 'package:client/features/home/widgets/workout_set_widget.dart';
import 'package:flutter/material.dart';

class SessionWorkoutWidget extends StatelessWidget {
  final String title;
  final String? equipment;
  const SessionWorkoutWidget({super.key, required this.title, this.equipment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/images/benchpress.png"),
              ),
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
          WorkoutSetWidget(),

          SizedBox(height: 10),
          LongCustomButton(
            title: "+ Add Sets",
            onTap: () {},
            Bcolor: Color(0xff242727),
          ),
        ],
      ),
    );
  }
}

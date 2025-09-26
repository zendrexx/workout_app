import 'package:flutter/material.dart';

class SessionCardWidget extends StatefulWidget {
  const SessionCardWidget({super.key});

  @override
  State<SessionCardWidget> createState() => _SessionCardWidgetState();
}

class _SessionCardWidgetState extends State<SessionCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff4E4A43)),
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
                  Text("PPL", style: TextStyle(fontSize: 16)),
                  IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero, // removes default padding
                    constraints: BoxConstraints(), // removes extra space
                    icon: Icon(Icons.more_horiz, size: 30, color: Colors.white),
                  ),
                ],
              ),

              Text(
                "Push day - Bench press, Machine fly..\nPull day - Lat PullDown, Pull ups, Row..\nLeg Day - Squat, Deadlift..",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

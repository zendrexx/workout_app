import 'package:client/features/home/widgets/long_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeListWidget extends StatelessWidget {
  const HomeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Programs",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xff4E4E50),
          ),
        ),

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
                    Text("PPL", style: TextStyle(fontSize: 16)),
                    IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero, // removes default padding
                      constraints: BoxConstraints(), // removes extra space
                      icon: Icon(
                        Icons.more_horiz,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                Text(
                  "Push day - Bench press, Machine fly..\nPull day - Lat PullDown, Pull ups, Row..\nLeg Day - Squat, Deadlift..",
                  style: TextStyle(fontSize: 14, color: Color(0xffEAE0C8)),
                ),
                SizedBox(height: 10),
                LongCustomButton(
                  title: "Start Program",
                  onTap: () => context.push('/home/session'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

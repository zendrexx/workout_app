import 'package:client/data/services/planned_session_service.dart';
import 'package:client/features/home/widgets/long_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeListWidget extends StatelessWidget {
  final Function fOntap;
  final String title;
  final int id;
  HomeListWidget({
    super.key,
    required this.fOntap,
    required this.id,
    this.title = "prac",
  });
  final sesService = PlannedSessionService();
  @override
  Widget build(BuildContext context) {
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

                Text(
                  "Bench press\nPull ups\nSquat",
                  style: TextStyle(fontSize: 14, color: Color(0xffEAE0C8)),
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

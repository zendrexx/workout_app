import 'package:flutter/material.dart';

class SessionCardWidget extends StatefulWidget {
  final bool? isClickable;
  const SessionCardWidget({super.key, this.isClickable});

  @override
  State<SessionCardWidget> createState() => _SessionCardWidgetState();
}

class _SessionCardWidgetState extends State<SessionCardWidget> {
  bool tapped = false;
  void tap() {
    setState(() => tapped = !tapped);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: GestureDetector(
        onTap: widget.isClickable == true ? tap : null,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: tapped ? Color(0xffE2725B) : Color(0xff4E4A43),
            ),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: Row(
              children: [
                // optional left indicator when tapped
                if (tapped) ...[
                  Container(
                    height: 100,
                    width: 5,
                    decoration: BoxDecoration(
                      color: Color(0xffE2725B),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  SizedBox(width: 20),
                ],

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("PPL", style: TextStyle(fontSize: 16)),
                            IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(
                                minWidth: 0,
                                minHeight: 0,
                              ), // optional
                              icon: Icon(
                                Icons.more_horiz,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Description (will wrap inside available width)
                      Text(
                        "Push day - Bench press, Machine fly..\nPull day - Lat PullDown, Pull ups, Row..\nLeg Day - Squat, Deadlift..",
                        style: TextStyle(fontSize: 14),
                      ),
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

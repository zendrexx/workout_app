import 'package:flutter/material.dart';

class SessionCardWidget extends StatelessWidget {
  final bool isSelectable;
  final bool isSelected;
  final VoidCallback? onTap;

  const SessionCardWidget({
    super.key,
    this.isSelectable = false,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: GestureDetector(
        onTap: isSelectable ? null : onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: isSelected
                  ? const Color(0xffE2725B)
                  : const Color(0xff4E4A43),
            ),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: Row(
              children: [
                if (isSelected) ...[
                  Container(
                    height: 100,
                    width: 5,
                    decoration: BoxDecoration(
                      color: const Color(0xffE2725B),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(width: 20),
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
                            const Text("PPL", style: TextStyle(fontSize: 16)),
                            isSelectable
                                ? const SizedBox.shrink()
                                : IconButton(
                                    onPressed: () {},
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(
                                      minWidth: 0,
                                      minHeight: 0,
                                    ),
                                    icon: const Icon(
                                      Icons.more_horiz,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                          ],
                        ),
                      ),

                      // Description
                      const Text(
                        "Push day - Bench press, Machine fly..\n"
                        "Pull day - Lat PullDown, Pull ups, Row..\n"
                        "Leg Day - Squat, Deadlift..",
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

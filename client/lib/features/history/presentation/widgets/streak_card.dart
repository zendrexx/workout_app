import 'package:client/features/history/presentation/widgets/tap_tooltip.dart';
import 'package:flutter/material.dart';

class StreakCard extends StatefulWidget {
  const StreakCard({super.key});

  @override
  State<StreakCard> createState() => _StreakCardState();
}

class _StreakCardState extends State<StreakCard> {
  @override
  Widget build(BuildContext context) {
    // 7 columns × 4 rows
    final List<bool> streakData = List.generate(28, (index) => index < 12);

    const days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF212121),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Streak",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                TapTooltip(),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT SIDE → Proper column layout
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(7, (colIndex) {
                      return Column(
                        children: [
                          // Day label
                          Text(
                            days[colIndex],
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // 4 circles per column
                          ...List.generate(4, (rowIndex) {
                            final index = rowIndex * 7 + colIndex;

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: streakData[index]
                                      ? Colors.white
                                      : Colors.grey.shade700,
                                ),
                              ),
                            );
                          }),
                        ],
                      );
                    }),
                  ),
                ),

                const SizedBox(width: 16),

                // RIGHT SIDE → streak info
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Column(
                      children: [
                        Text(
                          "12",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Days streak",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),
                    Icon(
                      Icons.local_fire_department,
                      color: Colors.orange,
                      size: 70,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DayLabel extends StatelessWidget {
  final String text;
  const DayLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }
}

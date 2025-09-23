import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class HeatmapWidget extends StatefulWidget {
  const HeatmapWidget({super.key});

  @override
  State<HeatmapWidget> createState() => _HeatmapWidgetState();
}

class _HeatmapWidgetState extends State<HeatmapWidget> {
  @override
  Widget build(BuildContext context) {
    return HeatMap(
      scrollable: true,
      datasets: {
        DateTime(2025, 1, 1): 5,
        DateTime(2025, 1, 2): 3,
        DateTime(2025, 1, 3): 1,
        DateTime(2025, 1, 4): 4,
      },

      colorsets: {
        1: Colors.red,
        2: Colors.orange,
        3: Colors.yellow,
        4: Colors.green,
        5: Colors.blue,
      },
    );
  }
}

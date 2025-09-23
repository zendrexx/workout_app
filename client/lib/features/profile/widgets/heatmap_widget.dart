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
      showColorTip: false,
      size: 12,
      fontSize: 10,
      borderRadius: 1,

      defaultColor: Color(0xff28292A),
      datasets: {
        DateTime(2025, 1, 1): 5,
        DateTime(2025, 1, 2): 3,
        DateTime(2025, 1, 3): 1,
        DateTime(2025, 1, 4): 4,
      },
      startDate: DateTime(2025, 1, 5),
      endDate: DateTime(2025, 12, 31),
      colorsets: {1: Color(0xffEDA938), 2: Color(0xff977F56)},
    );
  }
}

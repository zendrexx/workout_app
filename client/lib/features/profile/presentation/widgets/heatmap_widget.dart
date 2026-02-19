import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class HeatmapWidget extends StatefulWidget {
  final List<DateTime> dates;
  const HeatmapWidget({super.key, required this.dates});

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
        for (final date in widget.dates)
          DateTime(date.year, date.month, date.day): 1,
      },
      startDate: DateTime(2026, 1, 5),
      endDate: DateTime(2026, 12, 31),
      colorsets: {1: Color(0xff2F4F4F), 2: Color(0xff2F4F4F)},
    );
  }
}

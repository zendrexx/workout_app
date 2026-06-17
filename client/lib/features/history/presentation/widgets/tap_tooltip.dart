import 'package:flutter/material.dart';

class TapTooltip extends StatefulWidget {
  @override
  _TapTooltipState createState() => _TapTooltipState();
}

class _TapTooltipState extends State<TapTooltip> {
  final GlobalKey<TooltipState> tooltipKey = GlobalKey<TooltipState>();

  void _showTooltip() {
    tooltipKey.currentState?.ensureTooltipVisible();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showTooltip,
      child: Tooltip(
        key: tooltipKey,
        message: 'Miss 3 days in a row\nand your streak resets',
        waitDuration: Duration(milliseconds: 200),
        showDuration: Duration(seconds: 2),
        child: Icon(Icons.info_outline, color: Colors.white70),
      ),
    );
  }
}

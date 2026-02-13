import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewProgramWidget extends ConsumerStatefulWidget {
  final String title;
  final String content;
  const ViewProgramWidget({
    required this.title,
    required this.content,
    super.key,
  });

  @override
  ConsumerState<ViewProgramWidget> createState() => _ViewProgramWidgetState();
}

class _ViewProgramWidgetState extends ConsumerState<ViewProgramWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: BoxBorder.all(
            color: const Color.fromARGB(255, 148, 146, 146),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title.toUpperCase(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(widget.content, style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}

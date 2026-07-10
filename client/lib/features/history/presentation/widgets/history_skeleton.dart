import 'package:client/core/constants/AppColors.dart';
import 'package:flutter/material.dart';

/// Pulsing placeholder layout mirroring the History page while data loads.
class HistorySkeleton extends StatefulWidget {
  const HistorySkeleton({super.key});

  @override
  State<HistorySkeleton> createState() => _HistorySkeletonState();
}

class _HistorySkeletonState extends State<HistorySkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
    lowerBound: 0.4,
    upperBound: 1.0,
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          const _Box(height: 14, width: 90),
          const SizedBox(height: 8),
          Row(
            children: const [
              Expanded(child: _Box(height: 76)),
              SizedBox(width: 8),
              Expanded(child: _Box(height: 76)),
              SizedBox(width: 8),
              Expanded(child: _Box(height: 76)),
            ],
          ),
          const SizedBox(height: 24),
          const _Box(height: 156),
          const SizedBox(height: 24),
          const _Box(height: 14, width: 120),
          const SizedBox(height: 8),
          const _Box(height: 112),
          const SizedBox(height: 10),
          const _Box(height: 112),
          const SizedBox(height: 10),
          const _Box(height: 112),
        ],
      ),
    );
  }
}

class _Box extends StatelessWidget {
  final double height;
  final double? width;
  const _Box({required this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: Appcolors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

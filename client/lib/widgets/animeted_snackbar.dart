import 'package:flutter/material.dart';

void showCustomSnackbar(
  BuildContext context,
  String message, {
  Color color = Colors.black87,
  Duration duration = const Duration(seconds: 2),
  IconData? icon,
}) {
  // Remove any current snackbars first
  OverlayEntry? entry;

  entry = OverlayEntry(
    builder: (context) => _AnimatedSnackbar(
      message: message,
      color: color,
      icon: icon,
      duration: duration,
      onDismissed: () {
        entry?.remove();
      },
    ),
  );

  Overlay.of(context, rootOverlay: true).insert(entry);
}

class _AnimatedSnackbar extends StatefulWidget {
  final String message;
  final Color color;
  final IconData? icon;
  final Duration duration;
  final VoidCallback onDismissed;

  const _AnimatedSnackbar({
    required this.message,
    required this.color,
    required this.duration,
    required this.onDismissed,
    this.icon,
  });

  @override
  State<_AnimatedSnackbar> createState() => _AnimatedSnackbarState();
}

class _AnimatedSnackbarState extends State<_AnimatedSnackbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slide;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 1.2),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _fade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    // Automatically dismiss after duration
    Future.delayed(widget.duration, () async {
      await _controller.reverse();
      widget.onDismissed();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Positioned(
      bottom: mediaQuery.padding.bottom + 20,
      left: 16,
      right: 16,
      child: SlideTransition(
        position: _slide,
        child: FadeTransition(
          opacity: _fade,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: widget.color.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.icon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(widget.icon, color: Colors.white, size: 20),
                    ),
                  Expanded(
                    child: Text(
                      widget.message,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:client/features/auth/presentation/providers/auth_flow_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _scale = Tween<double>(
      begin: 0.94,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    Future<void>.delayed(const Duration(milliseconds: 1500), () {
      // if (!mounted) return;
      // final authState = ref.read(authFlowProvider);
      // if (!authState.isSignedIn) {
      //   context.go('/auth/signin');
      //   return;
      // }
      // if (!authState.onboardingCompleted) {
      //   context.go('/auth/onboarding');
      //   return;
      // }
      context.go('/home');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F0F0F),
      body: Center(
        child: FadeTransition(
          opacity: _fade,
          child: ScaleTransition(
            scale: _scale,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.bolt_rounded, color: Color(0xffEAE0C8), size: 64),
                SizedBox(height: 18),
                Text(
                  "ZHEVION",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Build Your Stronger Self",
                  style: TextStyle(color: Color(0xffA6A6A6), fontSize: 14),
                ),
                SizedBox(height: 18),
                SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.2,
                    color: Color(0xff895AF6),
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

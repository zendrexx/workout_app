import 'package:client/features/auth/presentation/providers/auth_flow_provider.dart';
import 'package:client/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:client/features/auth/presentation/widgets/primary_button.dart';
import 'package:client/features/auth/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _mockLogin() {
    final notifier = ref.read(authFlowProvider.notifier);
    notifier.signInMock();
    final state = ref.read(authFlowProvider);
    if (state.onboardingCompleted) {
      context.go('/home');
      return;
    }
    context.go('/auth/onboarding');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F0F0F),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                "ZHEVION",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Welcome back",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Sign in to continue your streak.",
                style: TextStyle(color: Color(0xff8F8F8F), fontSize: 14),
              ),
              const SizedBox(height: 28),
              AuthTextField(
                hint: "Email",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 14),
              AuthTextField(
                hint: "Password",
                controller: passwordController,
                obscureText: obscurePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                  icon: Icon(
                    obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xff8F8F8F),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(color: Color(0xffA6A6A6)),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              PrimaryButton(
                label: "Sign In",
                icon: Icons.login,
                onPressed: _mockLogin,
              ),
              const SizedBox(height: 22),
              Row(
                children: const [
                  Expanded(child: Divider(color: Color(0xff2C2C2C))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "or continue with",
                      style: TextStyle(color: Color(0xff8F8F8F), fontSize: 12),
                    ),
                  ),
                  Expanded(child: Divider(color: Color(0xff2C2C2C))),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  SocialButton(
                    label: "Google",
                    icon: Icons.g_mobiledata,
                    color: const Color(0xffDB4437),
                    onTap: _mockLogin,
                  ),
                  const SizedBox(width: 12),
                  SocialButton(
                    label: "Facebook",
                    icon: Icons.facebook,
                    color: const Color(0xff4267B2),
                    onTap: _mockLogin,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: TextButton(
                  onPressed: () => context.push('/auth/signup'),
                  child: const Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Color(0xffA6A6A6)),
                      children: [
                        TextSpan(
                          text: "Sign up",
                          style: TextStyle(
                            color: Color(0xffEAE0C8),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

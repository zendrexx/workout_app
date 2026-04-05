import 'package:client/features/auth/presentation/providers/auth_flow_provider.dart';
import 'package:client/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:client/features/auth/presentation/widgets/primary_button.dart';
import 'package:client/features/auth/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _mockCreate() {
    final notifier = ref.read(authFlowProvider.notifier);
    notifier.signInMock();
    notifier.updateName(nameController.text);
    context.go('/auth/onboarding');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xff0F0F0F),
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Start your fitness journey today.",
                style: TextStyle(color: Color(0xff8F8F8F), fontSize: 14),
              ),
              const SizedBox(height: 24),
              AuthTextField(hint: "Name", controller: nameController),
              const SizedBox(height: 14),
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
              const SizedBox(height: 16),
              PrimaryButton(
                label: "Create Account",
                icon: Icons.rocket_launch_rounded,
                onPressed: _mockCreate,
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
                    onTap: _mockCreate,
                  ),
                  const SizedBox(width: 12),
                  SocialButton(
                    label: "Facebook",
                    icon: Icons.facebook,
                    color: const Color(0xff4267B2),
                    onTap: _mockCreate,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

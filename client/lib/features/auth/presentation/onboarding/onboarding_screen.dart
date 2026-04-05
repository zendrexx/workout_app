import 'package:client/features/auth/presentation/providers/auth_flow_provider.dart';
import 'package:client/features/auth/presentation/widgets/onboarding_card.dart';
import 'package:client/features/auth/presentation/widgets/primary_button.dart';
import 'package:client/features/auth/presentation/widgets/progress_indicator_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  static const totalSteps = 4;
  final pageController = PageController();
  final nameController = TextEditingController();
  int currentStep = 1;
  int age = 22;
  double heightValue = 170;
  String heightUnit = 'cm';
  String selectedGoal = '';

  @override
  void initState() {
    super.initState();
    final existing = ref.read(authFlowProvider).onboardingData;
    nameController.text = existing.name;
    age = existing.age;
    heightValue = existing.heightValue;
    heightUnit = existing.heightUnit;
    selectedGoal = existing.goal;
  }

  @override
  void dispose() {
    pageController.dispose();
    nameController.dispose();
    super.dispose();
  }

  Future<void> _next() async {
    final notifier = ref.read(authFlowProvider.notifier);
    notifier.updateName(nameController.text);
    notifier.updateAge(age);
    notifier.updateHeightUnit(heightUnit);
    notifier.updateHeightValue(heightValue);
    notifier.updateGoal(selectedGoal);

    if (currentStep == totalSteps) {
      notifier.completeOnboarding();
      notifier.signInMock();
      context.go('/home');
      return;
    }

    await pageController.nextPage(
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOut,
    );
    setState(() => currentStep += 1);
  }

  @override
  Widget build(BuildContext context) {
    final microcopy = switch (currentStep) {
      1 => "Nice! Let's get to know you.",
      2 => "Great start, keep going.",
      3 => "Awesome. Almost there.",
      _ => "Let's go!",
    };

    return Scaffold(
      backgroundColor: const Color(0xff0F0F0F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressIndicatorBar(
                currentStep: currentStep,
                totalSteps: totalSteps,
              ),
              const SizedBox(height: 8),
              Text(
                microcopy,
                style: const TextStyle(color: Color(0xffA6A6A6), fontSize: 13),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    OnboardingCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "What should we call you?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: nameController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Your name",
                              hintStyle: const TextStyle(
                                color: Color(0xff8F8F8F),
                              ),
                              filled: true,
                              fillColor: const Color(0xff232323),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    OnboardingCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "How old are you?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 22),
                          Center(
                            child: Text(
                              "$age",
                              style: const TextStyle(
                                color: Color(0xffEAE0C8),
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Slider(
                            value: age.toDouble(),
                            min: 13,
                            max: 70,
                            activeColor: const Color(0xff2F4F4F),
                            inactiveColor: const Color(0xff353535),
                            onChanged: (v) => setState(() => age = v.round()),
                          ),
                        ],
                      ),
                    ),
                    OnboardingCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "What's your height?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              _UnitChip(
                                label: "cm",
                                selected: heightUnit == 'cm',
                                onTap: () => setState(() => heightUnit = 'cm'),
                              ),
                              const SizedBox(width: 10),
                              _UnitChip(
                                label: "ft",
                                selected: heightUnit == 'ft',
                                onTap: () => setState(() => heightUnit = 'ft'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: Text(
                              heightUnit == 'cm'
                                  ? "${heightValue.round()} cm"
                                  : "${heightValue.toStringAsFixed(1)} ft",
                              style: const TextStyle(
                                color: Color(0xffEAE0C8),
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Slider(
                            value: heightValue,
                            min: heightUnit == 'cm' ? 130 : 4.2,
                            max: heightUnit == 'cm' ? 220 : 7.5,
                            divisions: heightUnit == 'cm' ? 90 : 33,
                            activeColor: const Color(0xff2F4F4F),
                            inactiveColor: const Color(0xff353535),
                            onChanged: (v) => setState(() => heightValue = v),
                          ),
                        ],
                      ),
                    ),
                    OnboardingCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "What's your goal?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 18),
                          _GoalTile(
                            title: "Build Muscle",
                            emoji: "💪",
                            selected: selectedGoal == 'Build Muscle',
                            onTap: () =>
                                setState(() => selectedGoal = 'Build Muscle'),
                          ),
                          const SizedBox(height: 12),
                          _GoalTile(
                            title: "Lose Weight",
                            emoji: "🔥",
                            selected: selectedGoal == 'Lose Weight',
                            onTap: () =>
                                setState(() => selectedGoal = 'Lose Weight'),
                          ),
                          const SizedBox(height: 12),
                          _GoalTile(
                            title: "Stay Fit",
                            emoji: "⚡",
                            selected: selectedGoal == 'Stay Fit',
                            onTap: () =>
                                setState(() => selectedGoal = 'Stay Fit'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              PrimaryButton(
                label: currentStep == totalSteps ? "Finish" : "Continue",
                icon: currentStep == totalSteps
                    ? Icons.check_circle_outline
                    : Icons.arrow_forward_rounded,
                onPressed: _next,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UnitChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _UnitChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? const Color(0xff2F4F4F) : const Color(0xff232323),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label.toUpperCase(),
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xffA6A6A6),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _GoalTile extends StatelessWidget {
  final String title;
  final String emoji;
  final bool selected;
  final VoidCallback onTap;

  const _GoalTile({
    required this.title,
    required this.emoji,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: selected ? const Color(0xff223A3A) : const Color(0xff232323),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected
                  ? const Color(0xff2F4F4F)
                  : const Color(0xff2D2D2D),
            ),
          ),
          child: Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 20)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (selected)
                const Icon(
                  Icons.check_circle,
                  color: Color(0xffEAE0C8),
                  size: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

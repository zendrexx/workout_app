import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/profile/domain/entities/record_lift.dart';
import 'package:client/features/profile/domain/entities/user_profile.dart';
import 'package:client/features/profile/domain/entities/weight_unit.dart';
import 'package:client/features/profile/presentation/providers/profile_providers.dart';
import 'package:client/features/profile/presentation/widgets/profile_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// First-launch profile setup. Three steps, under a minute:
///  1. why the profile exists (and that everything stays on-device),
///  2. bodyweight and height — required, they anchor relative strength,
///  3. current maxes — every one of them skippable.
///
/// Rendered inside the Profile tab; once saved, the stream emits the new
/// profile and the page swaps to the real content.
class ProfileSetupFlow extends ConsumerStatefulWidget {
  const ProfileSetupFlow({super.key});

  @override
  ConsumerState<ProfileSetupFlow> createState() => _ProfileSetupFlowState();
}

class _ProfileSetupFlowState extends ConsumerState<ProfileSetupFlow> {
  static const _stepCount = 3;

  final _pageController = PageController();
  var _step = 0;
  var _unit = WeightUnit.lbs;
  var _saving = false;

  final _bodyWeight = TextEditingController();
  final _heightCm = TextEditingController();
  final _heightFeet = TextEditingController();
  final _heightInches = TextEditingController();
  final _maxControllers = {
    for (final lift in RecordLift.values.where((l) => l.supportsManualEntry))
      lift: TextEditingController(),
  };

  @override
  void dispose() {
    _pageController.dispose();
    _bodyWeight.dispose();
    _heightCm.dispose();
    _heightFeet.dispose();
    _heightInches.dispose();
    for (final controller in _maxControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  double? get _bodyWeightLbs {
    final value = double.tryParse(_bodyWeight.text);
    if (value == null || value <= 0) return null;
    return _unit.toLbs(value);
  }

  double? get _heightInCm {
    if (_unit == WeightUnit.kg) {
      final cm = double.tryParse(_heightCm.text);
      return (cm == null || cm <= 0) ? null : cm;
    }
    final feet = int.tryParse(_heightFeet.text);
    final inches = int.tryParse(_heightInches.text.isEmpty ? '0' : _heightInches.text);
    if (feet == null || feet <= 0 || inches == null || inches < 0) return null;
    return (feet * 12 + inches) * 2.54;
  }

  bool get _bodyStepValid => _bodyWeightLbs != null && _heightInCm != null;

  void _goTo(int step) {
    setState(() => _step = step);
    _pageController.animateToPage(
      step,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> _finish() async {
    final bodyWeightLbs = _bodyWeightLbs;
    final heightCm = _heightInCm;
    if (bodyWeightLbs == null || heightCm == null || _saving) return;

    final manualPrLbs = <RecordLift, double>{};
    _maxControllers.forEach((lift, controller) {
      final value = double.tryParse(controller.text);
      if (value != null && value > 0) {
        manualPrLbs[lift] = _unit.toLbs(value);
      }
    });

    setState(() => _saving = true);
    try {
      await ref.read(profileRepositoryProvider).saveProfile(
            UserProfile(
              displayName: "",
              bio: "",
              avatarPath: null,
              heightCm: heightCm,
              bodyWeightLbs: bodyWeightLbs,
              unit: _unit,
              manualPrLbs: manualPrLbs,
              createdAt: DateTime.now(),
            ),
          );
      // The profile stream now emits the saved profile and the Profile
      // page replaces this flow — nothing to navigate.
    } catch (_) {
      if (!mounted) return;
      setState(() => _saving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not save your profile")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _TopBar(
              step: _step,
              stepCount: _stepCount,
              onBack: _step == 0 ? null : () => _goTo(_step - 1),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _WelcomeStep(onContinue: () => _goTo(1)),
                  _BodyStep(
                    unit: _unit,
                    bodyWeight: _bodyWeight,
                    heightCm: _heightCm,
                    heightFeet: _heightFeet,
                    heightInches: _heightInches,
                    valid: _bodyStepValid,
                    onUnitChanged: (unit) => setState(() => _unit = unit),
                    onFieldChanged: () => setState(() {}),
                    onContinue: () => _goTo(2),
                  ),
                  _MaxesStep(
                    unit: _unit,
                    controllers: _maxControllers,
                    saving: _saving,
                    onFinish: _finish,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final int step;
  final int stepCount;
  final VoidCallback? onBack;

  const _TopBar({required this.step, required this.stepCount, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: onBack == null
                ? null
                : IconButton(
                    onPressed: onBack,
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < stepCount; i++)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: i == step ? 18 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: i <= step
                          ? Appcolors.accent
                          : Appcolors.secondaryColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }
}

class _WelcomeStep extends StatelessWidget {
  final VoidCallback onContinue;
  const _WelcomeStep({required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return _StepScaffold(
      children: [
        const Spacer(),
        Container(
          width: 88,
          height: 88,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Appcolors.accent.withValues(alpha: 0.15),
          ),
          child: const Icon(
            Icons.fitness_center,
            color: Appcolors.accent,
            size: 40,
          ),
        ),
        const SizedBox(height: 28),
        const Text(
          "Build your lifting identity",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w800,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "Your profile grades your strength against real standards and "
          "tracks what you become over years of training.\n\n"
          "Everything stays on this device. No account, no email.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Appcolors.muteText,
            fontSize: 14,
            height: 1.5,
          ),
        ),
        const Spacer(),
        _PrimaryButton(label: "Get started", onPressed: onContinue),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _BodyStep extends StatelessWidget {
  final WeightUnit unit;
  final TextEditingController bodyWeight;
  final TextEditingController heightCm;
  final TextEditingController heightFeet;
  final TextEditingController heightInches;
  final bool valid;
  final ValueChanged<WeightUnit> onUnitChanged;
  final VoidCallback onFieldChanged;
  final VoidCallback onContinue;

  const _BodyStep({
    required this.unit,
    required this.bodyWeight,
    required this.heightCm,
    required this.heightFeet,
    required this.heightInches,
    required this.valid,
    required this.onUnitChanged,
    required this.onFieldChanged,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return _StepScaffold(
      children: [
        const SizedBox(height: 8),
        const Text(
          "About you",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Strength only means something relative to the body lifting it. "
          "These two numbers power every ratio on your profile.",
          style: TextStyle(
            color: Appcolors.muteText,
            fontSize: 13,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),
        Center(child: UnitToggle(value: unit, onChanged: onUnitChanged)),
        const SizedBox(height: 24),
        ProfileNumberField(
          controller: bodyWeight,
          label: "Body weight",
          suffix: unit.label,
          onChanged: (_) => onFieldChanged(),
        ),
        const SizedBox(height: 14),
        if (unit == WeightUnit.kg)
          ProfileNumberField(
            controller: heightCm,
            label: "Height",
            suffix: "cm",
            onChanged: (_) => onFieldChanged(),
          )
        else
          Row(
            children: [
              Expanded(
                child: ProfileNumberField(
                  controller: heightFeet,
                  label: "Height",
                  suffix: "ft",
                  onChanged: (_) => onFieldChanged(),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ProfileNumberField(
                  controller: heightInches,
                  label: "",
                  suffix: "in",
                  onChanged: (_) => onFieldChanged(),
                ),
              ),
            ],
          ),
        const Spacer(),
        _PrimaryButton(
          label: "Continue",
          onPressed: valid ? onContinue : null,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _MaxesStep extends StatelessWidget {
  final WeightUnit unit;
  final Map<RecordLift, TextEditingController> controllers;
  final bool saving;
  final VoidCallback onFinish;

  const _MaxesStep({
    required this.unit,
    required this.controllers,
    required this.saving,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    return _StepScaffold(
      children: [
        const SizedBox(height: 8),
        const Text(
          "Your best lifts",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Enter the one-rep maxes you know so your strength level starts "
          "accurate. Skip anything — logged workouts fill these in over "
          "time.",
          style: TextStyle(
            color: Appcolors.muteText,
            fontSize: 13,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),
        for (final entry in controllers.entries) ...[
          ProfileNumberField(
            controller: entry.value,
            label: entry.key.displayName,
            suffix: unit.label,
          ),
          const SizedBox(height: 12),
        ],
        const Spacer(),
        _PrimaryButton(
          label: saving ? "Saving…" : "Finish",
          onPressed: saving ? null : onFinish,
        ),
        TextButton(
          onPressed: saving ? null : onFinish,
          child: const Text(
            "Skip for now",
            style: TextStyle(color: Appcolors.muteText, fontSize: 13),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

/// Step layout that keeps its buttons pinned to the bottom on tall screens
/// but scrolls gracefully when the keyboard eats the vertical space.
class _StepScaffold extends StatelessWidget {
  final List<Widget> children;
  const _StepScaffold({required this.children});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const _PrimaryButton({required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: Appcolors.accent,
        disabledBackgroundColor: Appcolors.secondaryColor,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}

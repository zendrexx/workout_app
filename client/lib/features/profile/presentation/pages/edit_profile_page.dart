import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/profile/domain/entities/record_lift.dart';
import 'package:client/features/profile/domain/entities/user_profile.dart';
import 'package:client/features/profile/domain/entities/weight_unit.dart';
import 'package:client/features/profile/presentation/providers/profile_providers.dart';
import 'package:client/features/profile/presentation/widgets/profile_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Edit everything the lifter owns: identity, body stats, units and the
/// manually entered maxes. Values are shown and entered in the chosen
/// unit; storage stays canonical lbs.
class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  UserProfile? _original;
  var _unit = WeightUnit.lbs;
  var _saving = false;

  final _name = TextEditingController();
  final _bio = TextEditingController();
  final _bodyWeight = TextEditingController();
  final _heightCm = TextEditingController();
  final _heightFeet = TextEditingController();
  final _heightInches = TextEditingController();
  final _maxControllers = {
    for (final lift in RecordLift.values.where((l) => l.supportsManualEntry))
      lift: TextEditingController(),
  };

  @override
  void initState() {
    super.initState();
    final profile = ref.read(userProfileProvider).valueOrNull;
    if (profile != null) _populate(profile);
  }

  void _populate(UserProfile profile) {
    _original = profile;
    _unit = profile.unit;
    _name.text = profile.displayName;
    _bio.text = profile.bio;
    _bodyWeight.text = _formatNumber(_unit.fromLbs(profile.bodyWeightLbs));
    _populateHeight(profile.heightCm);
    _maxControllers.forEach((lift, controller) {
      final lbs = profile.manualPrLbs[lift];
      controller.text = lbs == null ? '' : _formatNumber(_unit.fromLbs(lbs));
    });
  }

  void _populateHeight(double cm) {
    if (_unit == WeightUnit.kg) {
      _heightCm.text = _formatNumber(cm);
    } else {
      final totalInches = (cm / 2.54).round();
      _heightFeet.text = '${totalInches ~/ 12}';
      _heightInches.text = '${totalInches % 12}';
    }
  }

  /// Converts every populated numeric field when the unit toggles, so the
  /// lifter never has to re-enter values they already gave.
  void _switchUnit(WeightUnit next) {
    if (next == _unit) return;
    final heightCm = _heightInCm;
    final weightLbs = _weightLbs(_bodyWeight);
    final maxesLbs = {
      for (final entry in _maxControllers.entries)
        entry.key: _weightLbs(entry.value),
    };

    setState(() => _unit = next);

    if (weightLbs != null) {
      _bodyWeight.text = _formatNumber(next.fromLbs(weightLbs));
    }
    if (heightCm != null) _populateHeight(heightCm);
    maxesLbs.forEach((lift, lbs) {
      if (lbs != null) {
        _maxControllers[lift]!.text = _formatNumber(next.fromLbs(lbs));
      }
    });
  }

  double? _weightLbs(TextEditingController controller) {
    final value = double.tryParse(controller.text);
    if (value == null || value <= 0) return null;
    return _unit.toLbs(value);
  }

  double? get _heightInCm {
    if (_unit == WeightUnit.kg) {
      final cm = double.tryParse(_heightCm.text);
      return (cm == null || cm <= 0) ? null : cm;
    }
    final feet = int.tryParse(_heightFeet.text);
    final inches =
        int.tryParse(_heightInches.text.isEmpty ? '0' : _heightInches.text);
    if (feet == null || feet <= 0 || inches == null || inches < 0) return null;
    return (feet * 12 + inches) * 2.54;
  }

  String _formatNumber(double value) {
    final rounded = (value * 2).round() / 2;
    return rounded == rounded.truncate()
        ? '${rounded.truncate()}'
        : '$rounded';
  }

  Future<void> _save() async {
    final original = _original;
    final bodyWeightLbs = _weightLbs(_bodyWeight);
    final heightCm = _heightInCm;
    if (original == null || _saving) return;
    if (bodyWeightLbs == null || heightCm == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Body weight and height are required"),
        ),
      );
      return;
    }

    final manualPrLbs = <RecordLift, double>{};
    _maxControllers.forEach((lift, controller) {
      final lbs = _weightLbs(controller);
      if (lbs != null) manualPrLbs[lift] = lbs;
    });

    setState(() => _saving = true);
    try {
      await ref.read(profileRepositoryProvider).saveProfile(
            original.copyWith(
              displayName: _name.text.trim(),
              bio: _bio.text.trim(),
              heightCm: heightCm,
              bodyWeightLbs: bodyWeightLbs,
              unit: _unit,
              manualPrLbs: manualPrLbs,
            ),
          );
      if (mounted) context.pop();
    } catch (_) {
      if (!mounted) return;
      setState(() => _saving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not save your changes")),
      );
    }
  }

  @override
  void dispose() {
    _name.dispose();
    _bio.dispose();
    _bodyWeight.dispose();
    _heightCm.dispose();
    _heightFeet.dispose();
    _heightInches.dispose();
    for (final controller in _maxControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_original == null) {
      // Deep link before setup finished; nothing to edit yet.
      return const Scaffold(
        backgroundColor: Appcolors.backgroundColor,
        body: Center(
          child: Text(
            "Set up your profile first",
            style: TextStyle(color: Appcolors.muteText),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Appcolors.backgroundColor,
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "EDIT PROFILE",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _saving ? null : _save,
            child: Text(
              _saving ? "Saving…" : "Save",
              style: const TextStyle(
                color: Appcolors.accent,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          _sectionLabel("IDENTITY"),
          ProfileTextField(
            controller: _name,
            label: "Name",
            hint: "How should we call you?",
            maxLength: 30,
          ),
          const SizedBox(height: 6),
          ProfileTextField(
            controller: _bio,
            label: "About you",
            hint: "One line about you as a lifter",
            maxLines: 2,
            maxLength: 80,
          ),
          const SizedBox(height: 18),
          _sectionLabel("BODY"),
          Align(
            alignment: Alignment.centerLeft,
            child: UnitToggle(value: _unit, onChanged: _switchUnit),
          ),
          const SizedBox(height: 14),
          ProfileNumberField(
            controller: _bodyWeight,
            label: "Body weight",
            suffix: _unit.label,
          ),
          const SizedBox(height: 12),
          if (_unit == WeightUnit.kg)
            ProfileNumberField(
              controller: _heightCm,
              label: "Height",
              suffix: "cm",
            )
          else
            Row(
              children: [
                Expanded(
                  child: ProfileNumberField(
                    controller: _heightFeet,
                    label: "Height",
                    suffix: "ft",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ProfileNumberField(
                    controller: _heightInches,
                    label: "",
                    suffix: "in",
                  ),
                ),
              ],
            ),
          const SizedBox(height: 24),
          _sectionLabel("ONE-REP MAXES"),
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              "Manual entries count until a logged set beats them.",
              style: TextStyle(color: Appcolors.muteText, fontSize: 11),
            ),
          ),
          for (final entry in _maxControllers.entries) ...[
            ProfileNumberField(
              controller: entry.value,
              label: entry.key.displayName,
              suffix: _unit.label,
            ),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          color: Appcolors.muteText,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

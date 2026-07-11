import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/profile/domain/entities/weight_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Numeric input styled for the profile forms. [suffix] shows the unit so
/// the lifter always knows what they are typing.
class ProfileNumberField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? suffix;
  final ValueChanged<String>? onChanged;

  const ProfileNumberField({
    super.key,
    required this.controller,
    required this.label,
    this.suffix,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d{0,4}\.?\d{0,2}')),
      ],
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      cursorColor: Appcolors.accent,
      decoration: _profileInputDecoration(label: label, suffix: suffix),
    );
  }
}

/// Free-text input matching [ProfileNumberField]'s look.
class ProfileTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final int maxLines;
  final int? maxLength;

  const ProfileTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.maxLines = 1,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      style: const TextStyle(color: Colors.white, fontSize: 15),
      cursorColor: Appcolors.accent,
      decoration: _profileInputDecoration(label: label, hint: hint).copyWith(
        counterStyle: const TextStyle(color: Appcolors.muteText, fontSize: 10),
      ),
    );
  }
}

/// lbs / kg selector. One tap, immediately reflected in every field suffix.
class UnitToggle extends StatelessWidget {
  final WeightUnit value;
  final ValueChanged<WeightUnit> onChanged;

  const UnitToggle({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final unit in WeightUnit.values)
            GestureDetector(
              onTap: () => onChanged(unit),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: unit == value
                      ? Appcolors.accent
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  unit.label,
                  style: TextStyle(
                    color: unit == value ? Colors.white : Appcolors.muteText,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

InputDecoration _profileInputDecoration({
  required String label,
  String? suffix,
  String? hint,
}) {
  return InputDecoration(
    labelText: label,
    hintText: hint,
    hintStyle: const TextStyle(color: Appcolors.muteText, fontSize: 13),
    labelStyle: const TextStyle(color: Appcolors.muteText, fontSize: 13),
    floatingLabelStyle: const TextStyle(color: Appcolors.accent),
    suffixText: suffix,
    suffixStyle: const TextStyle(
      color: Appcolors.muteText,
      fontSize: 13,
      fontWeight: FontWeight.w600,
    ),
    filled: true,
    fillColor: Appcolors.primaryColor,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Appcolors.secondaryColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Appcolors.accent),
    ),
  );
}

import 'package:client/core/constants/AppColors.dart';
import 'package:client/core/utils/format_number.dart';
import 'package:client/features/profile/domain/entities/record_lift.dart';
import 'package:client/features/profile/domain/entities/strength_level.dart';
import 'package:client/features/profile/domain/entities/weight_unit.dart';
import 'package:flutter/material.dart';

/// A canonical-lbs weight rendered in the lifter's unit, e.g. "225" /
/// "102.5". Kilograms keep half-kilo precision; pounds display whole.
String formatWeightValue(double lbs, WeightUnit unit) {
  final value = unit.fromLbs(lbs);
  if (unit == WeightUnit.kg) {
    final rounded = (value * 2).round() / 2;
    return formatDoubleNumber(rounded);
  }
  return formatDoubleNumber(value.round());
}

/// Weight with its unit label: "225 lbs".
String formatWeight(double lbs, WeightUnit unit) {
  return '${formatWeightValue(lbs, unit)} ${unit.label}';
}

/// Hero-number variant with thousands separators: "1,050".
String formatWeightValueWithCommas(double lbs, WeightUnit unit) {
  final value = unit.fromLbs(lbs);
  if (unit == WeightUnit.kg) {
    return formatWithCommas((value * 2).round() / 2);
  }
  return formatWithCommas(value.round());
}

/// Height in the lifter's unit system: "178 cm" or 5'10" style.
String formatHeight(double cm, WeightUnit unit) {
  if (unit == WeightUnit.kg) return '${cm.round()} cm';
  final totalInches = (cm / 2.54).round();
  final feet = totalInches ~/ 12;
  final inches = totalInches % 12;
  return "$feet'$inches\"";
}

/// Bodyweight ratio like "1.62× BW".
String formatRatio(double ratio) => '${ratio.toStringAsFixed(2)}× BW';

/// Escalating color ramp for strength levels, ending in gold at elite.
Color strengthLevelColor(StrengthLevel level) {
  switch (level) {
    case StrengthLevel.untrained:
      return Appcolors.muteText;
    case StrengthLevel.novice:
      return Appcolors.info;
    case StrengthLevel.beginner:
      return Appcolors.success;
    case StrengthLevel.intermediate:
      return Appcolors.momentum;
    case StrengthLevel.advanced:
      return Appcolors.accent;
    case StrengthLevel.elite:
      return Appcolors.gold;
  }
}

/// Stable accent per competition lift, used by the balance bar and record
/// cards so a lift keeps its color everywhere on the page.
Color liftColor(RecordLift lift) {
  switch (lift) {
    case RecordLift.squat:
      return Appcolors.accent;
    case RecordLift.benchPress:
      return Appcolors.info;
    case RecordLift.deadlift:
      return Appcolors.momentum;
    default:
      return Appcolors.muteText;
  }
}

/// Display unit for weights. All weights are stored canonically in pounds;
/// the unit only affects how values are shown and entered.
enum WeightUnit {
  lbs,
  kg;

  static const double _lbsPerKg = 2.20462;

  String get label => this == WeightUnit.lbs ? 'lbs' : 'kg';

  /// Converts a canonical pound value into this display unit.
  double fromLbs(double lbs) =>
      this == WeightUnit.lbs ? lbs : lbs / _lbsPerKg;

  /// Converts a value entered in this unit back to canonical pounds.
  double toLbs(double value) =>
      this == WeightUnit.lbs ? value : value * _lbsPerKg;
}

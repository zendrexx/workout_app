class OnboardingData {
  final String name;
  final int age;
  final double heightValue;
  final String heightUnit;
  final String goal;

  const OnboardingData({
    this.name = '',
    this.age = 22,
    this.heightValue = 170,
    this.heightUnit = 'cm',
    this.goal = '',
  });

  OnboardingData copyWith({
    String? name,
    int? age,
    double? heightValue,
    String? heightUnit,
    String? goal,
  }) {
    return OnboardingData(
      name: name ?? this.name,
      age: age ?? this.age,
      heightValue: heightValue ?? this.heightValue,
      heightUnit: heightUnit ?? this.heightUnit,
      goal: goal ?? this.goal,
    );
  }
}

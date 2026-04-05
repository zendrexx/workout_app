import 'package:client/features/auth/domain/entities/onboarding_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthFlowState {
  final bool isSignedIn;
  final bool onboardingCompleted;
  final OnboardingData onboardingData;

  const AuthFlowState({
    required this.isSignedIn,
    required this.onboardingCompleted,
    required this.onboardingData,
  });

  factory AuthFlowState.initial() => const AuthFlowState(
    isSignedIn: false,
    onboardingCompleted: false,
    onboardingData: OnboardingData(),
  );

  AuthFlowState copyWith({
    bool? isSignedIn,
    bool? onboardingCompleted,
    OnboardingData? onboardingData,
  }) {
    return AuthFlowState(
      isSignedIn: isSignedIn ?? this.isSignedIn,
      onboardingCompleted: onboardingCompleted ?? this.onboardingCompleted,
      onboardingData: onboardingData ?? this.onboardingData,
    );
  }
}

class AuthFlowNotifier extends StateNotifier<AuthFlowState> {
  AuthFlowNotifier() : super(AuthFlowState.initial());

  void signInMock() {
    state = state.copyWith(isSignedIn: true);
  }

  void signOutMock() {
    state = AuthFlowState.initial();
  }

  void updateName(String name) {
    state = state.copyWith(
      onboardingData: state.onboardingData.copyWith(name: name.trim()),
    );
  }

  void updateAge(int age) {
    state = state.copyWith(
      onboardingData: state.onboardingData.copyWith(age: age),
    );
  }

  void updateHeightUnit(String unit) {
    state = state.copyWith(
      onboardingData: state.onboardingData.copyWith(heightUnit: unit),
    );
  }

  void updateHeightValue(double value) {
    state = state.copyWith(
      onboardingData: state.onboardingData.copyWith(heightValue: value),
    );
  }

  void updateGoal(String goal) {
    state = state.copyWith(
      onboardingData: state.onboardingData.copyWith(goal: goal),
    );
  }

  void completeOnboarding() {
    state = state.copyWith(onboardingCompleted: true);
  }
}

final authFlowProvider = StateNotifierProvider<AuthFlowNotifier, AuthFlowState>(
  (ref) {
    return AuthFlowNotifier();
  },
);

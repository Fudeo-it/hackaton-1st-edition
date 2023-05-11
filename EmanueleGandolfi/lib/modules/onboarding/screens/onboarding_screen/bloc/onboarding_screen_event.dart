part of 'onboarding_screen_bloc.dart';

@freezed
class OnboardingScreenEvent with _$OnboardingScreenEvent {
  const factory OnboardingScreenEvent.initialized() = _Initialized;
  const factory OnboardingScreenEvent.nextStepRequested() = _NextStepRequested;
}

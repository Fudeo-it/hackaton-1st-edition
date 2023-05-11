import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/app_preferences/repositories/app_preferences_repository.dart';

part 'onboarding_screen_event.dart';
part 'onboarding_screen_state.dart';
part 'onboarding_screen_bloc.freezed.dart';

class OnboardingScreenBloc extends Bloc<OnboardingScreenEvent, OnboardingScreenState> {
  final AppPreferencesRepository _appPreferencesRepository;

  OnboardingScreenBloc({
    required AppPreferencesRepository appPreferencesRepository
  }) : _appPreferencesRepository = appPreferencesRepository, super(const OnboardingScreenState()) {
    on<OnboardingScreenEvent>((event, emit) {
      event.when(
        initialized: () => _initialized(emit),
        nextStepRequested: () => _nextStepRequested(emit)
      );
    });
  }

  _initialized(Emitter<OnboardingScreenState> emit) {
    bool isOnboardingDone = _appPreferencesRepository.isOnboardingDone();
    emit(state.copyWith(
      status: isOnboardingDone ? OnboardingScreenStatus.alreadyDone : OnboardingScreenStatus.inProgress
    ));
  }

  _nextStepRequested(Emitter<OnboardingScreenState> emit) {
    if(state.activeStepIndex == state.totalSteps - 1) {
      _appPreferencesRepository.setOnboardingDone(true);
      emit(state.copyWith(
        status: OnboardingScreenStatus.finished
      ));
    } else {
      emit(state.copyWith(
        status: OnboardingScreenStatus.inProgress,
        activeStepIndex: state.activeStepIndex + 1,
      ));
    }
  }
}

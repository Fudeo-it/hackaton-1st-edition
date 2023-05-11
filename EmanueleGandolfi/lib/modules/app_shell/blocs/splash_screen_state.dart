part of 'splash_screen_bloc.dart';

@freezed
class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState({
    @Default(true)
    bool splashVisible
  }) = _SplashScreenState;
}

part of 'theme_mode_switcher_bloc.dart';

@freezed
class ThemeModeSwitcherState with _$ThemeModeSwitcherState {
  const ThemeModeSwitcherState._();

  factory ThemeModeSwitcherState({
    required bool isInitial,
    required bool darkMode,
    required GlobalKey screenshotBoundaryKey,
    required Offset clipOffset,
    ui.Image? screenshot
  }) = _ThemeModeSwitcherState;
}

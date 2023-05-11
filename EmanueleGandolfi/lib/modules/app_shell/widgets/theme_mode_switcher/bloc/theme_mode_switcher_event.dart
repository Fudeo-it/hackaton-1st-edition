part of 'theme_mode_switcher_bloc.dart';

@freezed
class ThemeModeSwitcherEvent with _$ThemeModeSwitcherEvent {
  const factory ThemeModeSwitcherEvent.themeModeToggled(Offset clipOffset) = _ThemeModeToggled;
}

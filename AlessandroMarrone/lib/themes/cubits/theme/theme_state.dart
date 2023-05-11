part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeType theme;
  const ThemeState([this.theme = ThemeType.system]);

  bool get light =>
      theme == ThemeType.light ||
      (theme == ThemeType.system &&
          SchedulerBinding.instance.window.platformBrightness ==
              Brightness.light);

  bool get dark =>
      theme == ThemeType.dark ||
      (theme == ThemeType.system &&
          SchedulerBinding.instance.window.platformBrightness ==
              Brightness.dark);

  @override
  List<Object> get props => [theme];
}

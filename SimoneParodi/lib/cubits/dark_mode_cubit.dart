import 'package:hydrated_bloc/hydrated_bloc.dart';

class DarkModeCubit extends HydratedCubit<bool> {
  static const _darkModeEnabled = 'darkModeEnabled';
  DarkModeCubit() : super(false);
  @override
  bool? fromJson(Map<String, dynamic> json) => json[_darkModeEnabled] as bool;

  @override
  Map<String, dynamic>? toJson(bool state) => {
        _darkModeEnabled: state,
      };

  void toggleDarkMode() => emit(!state);
}

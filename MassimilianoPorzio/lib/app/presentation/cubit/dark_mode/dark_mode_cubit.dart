import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/services/service_locator.dart';

part 'dark_mode_state.dart';

class DarkModeCubit extends Cubit<DarkModeState> {
  DarkModeCubit() : super(DarkModeState.initial());

  void toggleDarkMode() {
    final SharedPreferences prefs = sl<SharedPreferences>();

    emit(state.copyWith(
        mode:
            state.mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light));

    if (state.mode == ThemeMode.dark) {
      prefs.setBool("isDark", true);
    } else {
      prefs.remove("isDark");
    }
  }
}

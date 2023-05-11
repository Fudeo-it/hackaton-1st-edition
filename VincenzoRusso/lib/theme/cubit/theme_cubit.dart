import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:offertelavoroflutter_app/theme/models/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  @override
  ThemeState? fromJson(Map<String, dynamic> json) =>
      ThemeState(ThemeType.values.byName(json['theme'] as String));

  @override
  Map<String, dynamic>? toJson(ThemeState state) => {
        "theme": state.theme.name,
      };

  void setTheme(ThemeType? theme) => emit(
        ThemeState(theme ?? ThemeType.dark),
      );
}

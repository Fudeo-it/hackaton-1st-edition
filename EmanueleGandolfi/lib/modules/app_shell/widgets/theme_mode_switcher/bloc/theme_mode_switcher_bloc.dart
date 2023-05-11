import 'dart:ui' as ui;
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/app_preferences/repositories/app_preferences_repository.dart';

part 'theme_mode_switcher_event.dart';
part 'theme_mode_switcher_state.dart';
part 'theme_mode_switcher_bloc.freezed.dart';

class ThemeModeSwitcherBloc extends Bloc<ThemeModeSwitcherEvent, ThemeModeSwitcherState> {
  final AppPreferencesRepository _appPreferencesRepository;

  ThemeModeSwitcherBloc({
    required AppPreferencesRepository appPreferencesRepository
  }) : _appPreferencesRepository = appPreferencesRepository, super(ThemeModeSwitcherState(
      isInitial: true,
      darkMode: appPreferencesRepository.isDarkMode(),
      screenshotBoundaryKey: GlobalKey(),
      clipOffset: const Offset(0, 0)
  )) {
    on<ThemeModeSwitcherEvent>((event, emit) async {
      await event.when<Future>(
        themeModeToggled: (clipOffset) => _themeModeToggled(clipOffset, emit),
      );
    });
  }

  _themeModeToggled(Offset clipOffset, Emitter<ThemeModeSwitcherState> emit) async {
    bool newDarkMode = !state.darkMode;
    _appPreferencesRepository.setDarkMode(newDarkMode);

    // we create the "screenshot" to display behind the clipping animation
    final boundary = state.screenshotBoundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image screenshot = await boundary.toImage(pixelRatio: ui.window.devicePixelRatio);

    state.screenshot?.dispose(); // we dispose the previous screenshot if present

    emit(state.copyWith(
      isInitial: false,
      darkMode: newDarkMode,
      screenshot: screenshot,
      clipOffset: clipOffset
    ));
  }
}

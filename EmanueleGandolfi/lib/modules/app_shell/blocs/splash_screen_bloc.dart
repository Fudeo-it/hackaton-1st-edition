import 'package:bloc/bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';
part 'splash_screen_bloc.freezed.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(const SplashScreenState()) {
    on<SplashScreenEvent>((event, emit) {
      event.when(
        splashRemoved: () => _splashRemoved(emit)
      );
    });
  }

  _splashRemoved(Emitter<SplashScreenState> emit) {
    if(!state.splashVisible) return;

    FlutterNativeSplash.remove();
    emit(state.copyWith(splashVisible: false));
  }
}

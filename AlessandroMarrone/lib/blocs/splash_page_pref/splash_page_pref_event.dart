part of 'splash_page_pref_bloc.dart';

abstract class SplashPagePrefEvent extends Equatable {
  const SplashPagePrefEvent();

  @override
  List<Object> get props => [];
}

class FetchSplashPagePrefEvent extends SplashPagePrefEvent {}

class HideSplashPagePrefEvent extends SplashPagePrefEvent {}

class ShowSplashPagePrefEvent extends SplashPagePrefEvent {}

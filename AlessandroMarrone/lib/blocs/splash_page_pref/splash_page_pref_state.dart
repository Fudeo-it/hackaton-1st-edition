part of 'splash_page_pref_bloc.dart';

abstract class SplashPagePrefState extends Equatable {
  const SplashPagePrefState();

  @override
  List<Object> get props => [];
}

class UndefinedSplashPagePrefState extends SplashPagePrefState {}

class LoadedSplashPagePrefState extends SplashPagePrefState {
  final bool showSplashPage;

  const LoadedSplashPagePrefState({
    required this.showSplashPage,
  });

  @override
  List<Object> get props => [showSplashPage];
}

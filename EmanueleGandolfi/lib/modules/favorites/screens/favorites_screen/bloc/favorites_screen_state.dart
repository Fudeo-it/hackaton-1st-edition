part of 'favorites_screen_bloc.dart';

@freezed
class FavoritesScreenState with _$FavoritesScreenState {
  const factory FavoritesScreenState({
    @Default(0)
    int activeTabIndex
  }) = _FavoritesScreenState;
}

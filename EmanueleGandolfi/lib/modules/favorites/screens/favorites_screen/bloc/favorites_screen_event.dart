part of 'favorites_screen_bloc.dart';

@freezed
class FavoritesScreenEvent with _$FavoritesScreenEvent {
  const factory FavoritesScreenEvent.activeTabChanged(int index) = _ActiveTabChanged;
}

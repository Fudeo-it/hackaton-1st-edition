part of 'favourite_checkbox_bloc.dart';

abstract class FavouriteCheckboxEvent extends Equatable {
  const FavouriteCheckboxEvent();

  @override
  List<Object> get props => [];
}

class FavouriteCheckboxToggled extends FavouriteCheckboxEvent {
  const FavouriteCheckboxToggled();
}

class FavouriteCheckboxChanged extends FavouriteCheckboxEvent {
  const FavouriteCheckboxChanged({
    required this.checked,
  });

  final bool checked;

  @override
  List<Object> get props => [checked];
}

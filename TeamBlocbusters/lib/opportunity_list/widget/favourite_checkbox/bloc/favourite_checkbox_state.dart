part of 'favourite_checkbox_bloc.dart';

class FavouriteCheckboxState extends Equatable {
  const FavouriteCheckboxState({required this.checked});

  final bool checked;

  @override
  List<Object> get props => [checked];
}

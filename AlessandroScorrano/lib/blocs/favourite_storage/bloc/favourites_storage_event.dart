import 'package:annunci_lavoro_flutter/models/favourites_store_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouritesStorageEvent extends Equatable {
  const FavouritesStorageEvent();

  @override
  List<Object> get props => [];
}

class AddFavorite extends FavouritesStorageEvent {
  final FavouriteStoreModel favourite;

  const AddFavorite(this.favourite);

  @override
  List<Object> get props => [favourite];
}

class RemoveFavorite extends FavouritesStorageEvent {
  final FavouriteStoreModel favourite;

  const RemoveFavorite(this.favourite);

  @override
  List<Object> get props => [favourite];
}

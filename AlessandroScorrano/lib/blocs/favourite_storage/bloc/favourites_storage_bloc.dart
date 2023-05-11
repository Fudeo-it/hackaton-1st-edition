import 'package:annunci_lavoro_flutter/blocs/favourite_storage/bloc/favourites_storage_event.dart';
import 'package:annunci_lavoro_flutter/blocs/favourite_storage/bloc/favourites_storage_state.dart';
import 'package:annunci_lavoro_flutter/models/favourites_store_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class FavouritesStorageBloc

    ///
    /// [HydratedBloc] utilizzato per salvare gli annunci preferiti in memoria.
    ///
    /// salva degli oggetti di tipo [FavouriteStoreModel] per conservare anche il tipo di annuncio oltre all'id.
    ///
    extends HydratedBloc<FavouritesStorageEvent, FavouritesStorageState> {
  FavouritesStorageBloc() : super(const FavouritesStorageState()) {
    on((event, emit) {
      if (event is AddFavorite) {
        final newState = state.copyWith(
          favorites: Set.of(state.favorites)..add(event.favourite),
        );
        emit(newState);
      } else if (event is RemoveFavorite) {
        final newState = state.copyWith(
          favorites: Set.of(state.favorites)
            ..removeWhere((favorite) => event.favourite.id == favorite.id),
        );
        emit(newState);
      }
    });
  }

  @override
  FavouritesStorageState fromJson(Map<String, dynamic> json) {
    final favoritesJson = json['favorites'] as List<dynamic>?;
    final favorites = favoritesJson
            ?.map((favJson) => FavouriteStoreModel.fromJson(favJson))
            .toSet() ??
        <FavouriteStoreModel>{};
    return FavouritesStorageState(favorites: favorites);
  }

  @override
  Map<String, dynamic> toJson(FavouritesStorageState state) {
    final favoritesJson = state.favorites.map((fav) => fav.toJson()).toList();
    return {'favorites': favoritesJson};
  }

  void addToFavourite(FavouriteStoreModel fav) => add(AddFavorite(fav));

  void removeFromFavourite(FavouriteStoreModel fav) => add(RemoveFavorite(fav));

  bool isFavourite(String favId) =>
      state.favorites.any((fav) => fav.id == favId);

  List<FavouriteStoreModel> getFavourites() => state.favorites.toList();
}

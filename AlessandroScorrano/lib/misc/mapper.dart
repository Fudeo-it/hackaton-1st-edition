import 'package:annunci_lavoro_flutter/blocs/favourite_storage/bloc/favourites_storage_bloc.dart';

abstract class DTOMapper<D, M> {
  final FavouritesStorageBloc favouritesBloc;
  DTOMapper({required this.favouritesBloc});

  M toModel(D dto);

  D toTransferObject(M model);
}

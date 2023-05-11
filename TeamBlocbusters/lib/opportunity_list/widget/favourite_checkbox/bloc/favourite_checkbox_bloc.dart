import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favourites_repository/favourites_repository.dart';

part 'favourite_checkbox_event.dart';
part 'favourite_checkbox_state.dart';

class FavouriteCheckboxBloc
    extends Bloc<FavouriteCheckboxEvent, FavouriteCheckboxState> {
  FavouriteCheckboxBloc({
    required String id,
    required FavouritesRepository favouritesRepository,
  })  : _favouriteRepository = favouritesRepository,
        _id = id,
        super(
          FavouriteCheckboxState(
            checked: favouritesRepository.isFavourite(id),
          ),
        ) {
    _streamSubscription = favouritesRepository.favourites.listen(
      (event) {
        add(FavouriteCheckboxChanged(checked: event.contains(id)));
      },
    );
    on<FavouriteCheckboxToggled>(_handleFavouriteCheckboxToggled);
    on<FavouriteCheckboxChanged>(_handleFavouriteCheckboxChanged);
  }

  final FavouritesRepository _favouriteRepository;
  late final StreamSubscription<List<String>> _streamSubscription;
  final String _id;

  void _handleFavouriteCheckboxToggled(
    FavouriteCheckboxToggled event,
    Emitter<FavouriteCheckboxState> emit,
  ) {
    _favouriteRepository.toggleFavourite(_id);
    emit(
      FavouriteCheckboxState(
        checked: _favouriteRepository.isFavourite(_id),
      ),
    );
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }

  void _handleFavouriteCheckboxChanged(
    FavouriteCheckboxChanged event,
    Emitter<FavouriteCheckboxState> emit,
  ) {
    emit(
      FavouriteCheckboxState(
        checked: event.checked,
      ),
    );
  }
}

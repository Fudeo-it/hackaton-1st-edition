import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites_screen_event.dart';
part 'favorites_screen_state.dart';
part 'favorites_screen_bloc.freezed.dart';

class FavoritesScreenBloc extends Bloc<FavoritesScreenEvent, FavoritesScreenState> {
  FavoritesScreenBloc() : super(const FavoritesScreenState()) {
    on<FavoritesScreenEvent>((event, emit) {
      event.when(
        activeTabChanged: (index) => emit(state.copyWith(activeTabIndex: index)),
      );
    });
  }
}

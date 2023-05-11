import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';
part 'home_screen_bloc.freezed.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(const HomeScreenState()) {
    on<HomeScreenEvent>((event, emit) {
      event.when(
        activeTabChanged: (index) => emit(state.copyWith(activeTabIndex: index)),
      );
    });
  }
}

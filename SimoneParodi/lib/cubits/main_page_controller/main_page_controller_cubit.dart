import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'main_page_controller_state.dart';

class MainPageViewControllerCubit extends Cubit<MainPageViewControllerState> {
  final PageController _pageController = PageController();

  MainPageViewControllerCubit()
      : super(const MainPageViewControllerState(
          page: 0,
          offset: 0,
        )) {
    _pageController.addListener(() {
      emit(
        MainPageViewControllerState(
          offset: _pageController.offset,
          page: _pageController.page ?? 0,
        ),
      );
    });
  }

  PageController get pageController => _pageController;

  void selectPage({
    required int pageIndex,
  }) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
  }

  @override
  Future<void> close() {
    _pageController.dispose();
    return super.close();
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_it_app/repositories/local_storage_repository.dart';

part 'show_splash_page_state.dart';

class ShowSplashPageCubit extends Cubit<ShowSplashPageState> {
  final LocalStoragePrefRepository localStoragePrefRepository;
  ShowSplashPageCubit({required this.localStoragePrefRepository})
      : super(const ShowSplashPageState(false));

  void getShowSpashPagePref() async {
    final isShow = await localStoragePrefRepository.showSplashPage;
    emit(ShowSplashPageState(isShow ?? false));
  }
}

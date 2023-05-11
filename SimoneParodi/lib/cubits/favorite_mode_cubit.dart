import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteModeCubit extends Cubit<bool> {
  FavoriteModeCubit() : super(false);

  void toogle() => emit(!state);
}

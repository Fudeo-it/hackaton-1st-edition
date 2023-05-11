import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:job_app/core/log/bloc_logger.dart';
import 'package:job_app/features/preferiti/domain/usecases/preferiti_filter_params.dart';

part 'preferiti_filters_state.dart';

class PreferitiFiltersCubit extends Cubit<PreferitiFiltersState>
    with BlocLoggy {
  PreferitiFiltersCubit() : super(PreferitiFiltersState.initial());

  void reset() {
    emit(PreferitiFiltersState.initial());
  }

  void setSearchTerm(String? searchTerm) {
    loggy.debug("SETTO IL TERMINE DI RICERCA NEL CUBIT");
    emit(state.copyWith(searchTerm: searchTerm));
  }
}

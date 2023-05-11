import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/core/log/bloc_logger.dart';
import 'package:job_app/features/aziende/domain/usecases/annunci_azienda_params.dart';

part 'aziende_filter_state.dart';

class AziendeFilterCubit extends Cubit<AziendeFilterState> with BlocLoggy {
  AziendeFilterCubit() : super(AziendeFilterState.initial());

  void reset() {
    emit(AziendeFilterState.initial());
  }

  void resetFiltri() {
    emit(state.copyWith(
        juniorSeniorityFilter: false,
        midSeniorityFilter: false,
        seniorSeniorityFilter: false,
        fullTimeFilter: false,
        partTimeFilter: false,
        inSedeFilter: false,
        ibridoFilter: false,
        fullRemoteFilter: false));
  }

  void setSearchTerm(String? searchTerm) {
    loggy.debug("SETTO IL TERMINE DI RICERCA NEL CUBIT");
    emit(state.copyWith(searchTerm: searchTerm));
  }

  void setJuniorSeniorityFilter(bool selected) {
    emit(state.copyWith(juniorSeniorityFilter: selected));
  }

  void setMidSeniorityFilter(bool selected) {
    emit(state.copyWith(midSeniorityFilter: selected));
  }

  void setSeniorSeniorityFilter(bool selected) {
    emit(state.copyWith(seniorSeniorityFilter: selected));
  }

  void setFullTimeFilter(bool selected) {
    emit(state.copyWith(fullTimeFilter: selected));
  }

  void setPartTimeFilter(bool selected) {
    emit(state.copyWith(partTimeFilter: selected));
  }

  void setFullRemoteilter(bool selected) {
    emit(state.copyWith(fullRemoteFilter: selected));
  }

  void setIbridoFilter(bool selected) {
    emit(state.copyWith(ibridoFilter: selected));
  }

  void setInSedeFilter(bool selected) {
    emit(state.copyWith(inSedeFilter: selected));
  }
}

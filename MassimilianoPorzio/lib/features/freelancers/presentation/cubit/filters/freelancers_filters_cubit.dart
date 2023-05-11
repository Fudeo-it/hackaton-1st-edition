import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:job_app/core/log/bloc_logger.dart';
import 'package:job_app/features/freelancers/domain/usecases/annunci_freelancer_params.dart';

part 'freelancers_filters_state.dart';

class FreelancersFiltersCubit extends Cubit<FreelancersFiltersState>
    with BlocLoggy {
  FreelancersFiltersCubit() : super(FreelancersFiltersState.initial());

  void reset() {
    emit(FreelancersFiltersState.initial());
  }

  void resetFiltri() {
    emit(state.copyWith(
      siNdaFilter: false,
      noNdaFilter: false,
      soloRelazioneFilter: false,
      altriRelazioneFilter: false,
    ));
  }

  void setSearchTerm(String? searchTerm) {
    loggy.debug("SETTO IL TERMINE DI RICERCA NEL CUBIT");
    emit(state.copyWith(searchTerm: searchTerm));
  }

  void setSiNdaFilter(bool selected) {
    emit(state.copyWith(siNdaFilter: selected));
  }

  void setNoNdaFilter(bool selected) {
    emit(state.copyWith(noNdaFilter: selected));
  }

  void setSoloRelazioneFilter(bool selected) {
    emit(state.copyWith(soloRelazioneFilter: selected));
  }

  void setAltriRelazioneFilter(bool selected) {
    emit(state.copyWith(altriRelazioneFilter: selected));
  }
}

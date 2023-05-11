import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter/models/models.dart';

part 'filters_state.dart';

class FiltersCubit extends Cubit<FiltersState> {
  FiltersCubit() : super(const FiltersState());

  void query(String query) {
    emit(state.copyWith(query: query));
  }

  void team(Team team) {
    emit(state.copyWith(team: team));
  }

  void contract(Contract contract) {
    emit(state.copyWith(contract: contract));
  }

  void seniority(Seniority seniority) {
    emit(state.copyWith(seniority: seniority));
  }

  void ral(List<double> ral) {
    emit(state.copyWith(ral: ral));
  }

  void reset() {
    emit(state.copyWith(
      query: '',
      seniority: Seniority.all,
      contract: Contract.all,
      team: Team.all,
      ral: const [0, 100000],
    ));
  }
}

part of 'filters_cubit.dart';

class FiltersState extends Equatable {
  const FiltersState({
    this.query = '',
    this.seniority = Seniority.all,
    this.contract = Contract.all,
    this.team = Team.all,
    this.ral = const [0, 100000],
  });

  final String query;
  final Seniority seniority;
  final Contract contract;
  final Team team;
  final List<double> ral;

  FiltersState copyWith({
    String? query,
    Seniority? seniority,
    Contract? contract,
    Team? team,
    List<double>? ral,
  }) {
    return FiltersState(
      query: query ?? this.query,
      seniority: seniority ?? this.seniority,
      contract: contract ?? this.contract,
      team: team ?? this.team,
      ral: ral ?? this.ral,
    );
  }

  @override
  List<Object> get props => [query, seniority, contract, team, ral];
}

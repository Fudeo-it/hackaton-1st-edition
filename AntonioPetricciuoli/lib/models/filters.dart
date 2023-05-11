import 'package:equatable/equatable.dart';

enum Seniority { all, junior, mid, senior }

enum Contract { all, fullTime, partTime }

enum Team { all, fullRemote, ibrid, inOffice }

class Filters extends Equatable {
  const Filters({
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

  Filters copyWith({
    String? query,
    Seniority? seniority,
    Contract? contract,
    Team? team,
    List<double>? ral,
  }) {
    return Filters(
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

import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/models/enum/contract_type.dart';
import 'package:offertelavoroflutter_app/models/enum/relationship.dart';
import 'package:offertelavoroflutter_app/models/enum/seniority.dart';
import 'package:offertelavoroflutter_app/models/enum/team_location.dart';

class Filters extends Equatable {
  final String textFilter;
  final String codeFilter;
  final List<TeamLocation> teamFilter;
  final List<Seniority> seniorityFilter;
  final List<ContractType> contractFilter;
  final List<Relationship> relationshipFilter;
  final List<String> ndaFilter;

  const Filters({
    this.textFilter = '',
    this.codeFilter = '',
    this.teamFilter = const [],
    this.contractFilter = const [],
    this.seniorityFilter = const [],
    this.relationshipFilter = const [],
    this.ndaFilter = const [],
  });

  @override
  List<Object?> get props => [
        textFilter,
        teamFilter,
        seniorityFilter,
        contractFilter,
        relationshipFilter,
        ndaFilter,
      ];
}

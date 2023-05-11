import 'package:offertelavoroflutter_app/models/enum/contract_type.dart';
import 'package:offertelavoroflutter_app/models/enum/relationship.dart';
import 'package:offertelavoroflutter_app/models/enum/seniority.dart';
import 'package:offertelavoroflutter_app/models/enum/team_location.dart';
import 'package:offertelavoroflutter_app/models/filters.dart';
import 'package:offertelavoroflutter_app/services/network/dto/filter_dto.dart';
import 'package:pine/pine.dart';

class FiltersMapper extends DTOMapper<FiltersDTO, Filters> {
  @override
  FiltersDTO toDTO(Filters model) => FiltersDTO(
        textFilter: model.textFilter,
        codeFilter: model.codeFilter,
        teamFilter: model.teamFilter
            .map((team) => team.getString)
            .toList(growable: false),
        seniorityFilter: model.seniorityFilter
            .map((seniority) => seniority.getString)
            .toList(growable: false),
        contractFilter: model.contractFilter
            .map((contract) => contract.getString)
            .toList(growable: false),
        relationshipFilter: model.relationshipFilter
            .map((relationship) => relationship.getString)
            .toList(growable: false),
        ndaFilter: model.ndaFilter,
      );

  @override
  Filters fromDTO(FiltersDTO dto) {
    // TODO: implement fromDTO
    throw UnimplementedError();
  }
}

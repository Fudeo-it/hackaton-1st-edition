import 'package:offertelavoroflutter_app/models/enum/sort_type.dart';
import 'package:offertelavoroflutter_app/models/sorts.dart';
import 'package:offertelavoroflutter_app/services/network/dto/sort_dto.dart';
import 'package:pine/pine.dart';

class SortsMapper extends DTOMapper<SortsDTO, Sorts> {
  @override
  Sorts fromDTO(SortsDTO dto) {
    // TODO: implement fromDTO
    throw UnimplementedError();
  }

  @override
  SortsDTO toDTO(Sorts model) => SortsDTO(
        name: model.name == SortType.none ? "" : model.name.name,
        seniority: model.seniority == SortType.none ? "" : model.seniority.name,
        team: model.team == SortType.none ? "" : model.team.name,
        contract: model.contract == SortType.none ? "" : model.contract.name,
        ral: model.ral == SortType.none ? "" : model.ral.name,
        nda: model.nda == SortType.none ? "" : model.nda.name,
        relationship:
            model.relationship == SortType.none ? "" : model.relationship.name,
        budget: model.budget == SortType.none ? "" : model.budget.name,
        paymentTiming: model.paymentTiming == SortType.none
            ? ""
            : model.paymentTiming.name,
        timelines: model.timelines == SortType.none ? "" : model.timelines.name,
      );
}

import 'package:job_app/core/data/mappers/base_mapper.dart';
import 'package:job_app/features/aziende/data/models/contratto_model.dart';

import '../../domain/entities/contratto_entity.dart';

class ContrattoMapper extends EntityMapper<ContrattoModel?, ContrattoEntity?> {
  @override
  ContrattoModel? fromEntity(ContrattoEntity? entity) {
    if (entity == null) {
      return null;
    } else {
      return ContrattoModel(
          contratto: entity.contratto,
          backgroundColorString: entity.backgroundColorString);
    }
  }

  @override
  ContrattoEntity? toEntity(ContrattoModel? model) {
    if (model == null) {
      return null;
    } else {
      return ContrattoEntity(
        contratto: model.contratto,
        backgroundColorString: model.backgroundColorString,
      );
    }
  }
}

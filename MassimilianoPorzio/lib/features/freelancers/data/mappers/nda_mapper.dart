import 'package:job_app/core/data/mappers/base_mapper.dart';
import 'package:job_app/features/freelancers/data/models/nda_model.dart';
import 'package:job_app/features/freelancers/domain/entities/nda_entity.dart';

class NdaMapper extends EntityMapper<NdaModel?, NdaEntity?> {
  @override
  NdaModel? fromEntity(NdaEntity? entity) {
    if (entity == null) {
      return null;
    } else {
      return NdaModel(
          nda: entity.nda, backgroundColorString: entity.backgroundColorString);
    }
  }

  @override
  NdaEntity? toEntity(NdaModel? model) {
    if (model == null) {
      return null;
    } else {
      return NdaEntity(
        nda: model.nda,
        backgroundColorString: model.backgroundColorString,
      );
    }
  }
}

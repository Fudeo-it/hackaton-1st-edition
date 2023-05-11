import 'package:job_app/core/data/mappers/base_mapper.dart';

import '../../domain/entities/seniority_enitity.dart';
import '../models/seniority_model.dart';

class SeniorityMapper extends EntityMapper<SeniorityModel?, SeniorityEntity?> {
  @override
  SeniorityModel? fromEntity(SeniorityEntity? entity) {
    if (entity == null) {
      return null;
    } else {
      return SeniorityModel(
          seniority: entity.seniority,
          backgroundColorString: entity.backgroundColorString);
    }
  }

  @override
  SeniorityEntity? toEntity(SeniorityModel? model) {
    if (model == null) {
      return null;
    } else {
      return SeniorityEntity(
        seniority: model.seniority,
        backgroundColorString: model.backgroundColorString,
      );
    }
  }
}

import 'package:job_app/core/data/mappers/base_mapper.dart';
import 'package:job_app/core/data/models/rich_text_annotation_model.dart';
import 'package:job_app/core/data/models/rich_text_model.dart';
import 'package:job_app/core/domain/entities/rich_text_annotation.dart';
import 'package:job_app/core/domain/entities/rich_text_entity.dart';
import 'package:job_app/core/domain/entities/typedefs.dart';

final modelToEntityMapper = RichTextMapper();

class RichTextMapper extends EntityMapper<RichTextModel, RichTextTextEntity> {
  @override
  RichTextModel fromEntity(RichTextTextEntity entity) {
    return RichTextModel(
      plainText: entity.plainText,
      annotation: RichTextAnnotationModel(
          bold: entity.annotation.bold,
          italic: entity.annotation.italic,
          strikethrough: entity.annotation.strikethrough,
          underline: entity.annotation.underline,
          code: entity.annotation.code,
          colorString: entity.annotation.colorString),
    );
  }

  @override
  RichTextTextEntity toEntity(RichTextModel model) {
    return RichTextTextEntity(
      plainText: model.plainText,
      annotation: RichTextAnnotation(
          bold: model.annotation.bold,
          italic: model.annotation.italic,
          strikethrough: model.annotation.strikethrough,
          underline: model.annotation.underline,
          code: model.annotation.code,
          colorString: model.annotation.colorString),
    );
  }
}

extension RichTextExt on List<RichTextModel> {
  RichTextList get richTextList =>
      map((e) => modelToEntityMapper.toEntity(e)).toList();
}

extension RichTextModelExt on List<RichTextTextEntity> {
  RichTextModelList get richTextModelList =>
      map((e) => modelToEntityMapper.fromEntity(e)).toList();
}

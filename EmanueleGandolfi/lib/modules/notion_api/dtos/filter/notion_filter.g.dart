// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotionFilterSelect _$$NotionFilterSelectFromJson(Map<String, dynamic> json) =>
    _$NotionFilterSelect(
      json['property'] as String,
      const NotionFilterConditionConverter()
          .fromJson(json['select'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotionFilterSelectToJson(
        _$NotionFilterSelect instance) =>
    <String, dynamic>{
      'property': instance.property,
      'select': const NotionFilterConditionConverter().toJson(instance.select),
      'runtimeType': instance.$type,
    };

_$NotionFilterRichText _$$NotionFilterRichTextFromJson(
        Map<String, dynamic> json) =>
    _$NotionFilterRichText(
      json['property'] as String,
      const NotionFilterConditionConverter()
          .fromJson(json['rich_text'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotionFilterRichTextToJson(
        _$NotionFilterRichText instance) =>
    <String, dynamic>{
      'property': instance.property,
      'rich_text':
          const NotionFilterConditionConverter().toJson(instance.richText),
      'runtimeType': instance.$type,
    };

_$NotionFilterAnd _$$NotionFilterAndFromJson(Map<String, dynamic> json) =>
    _$NotionFilterAnd(
      (json['and'] as List<dynamic>)
          .map((e) =>
              const NotionFilterConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotionFilterAndToJson(_$NotionFilterAnd instance) =>
    <String, dynamic>{
      'and': instance.and.map(const NotionFilterConverter().toJson).toList(),
      'runtimeType': instance.$type,
    };

_$NotionFilterOr _$$NotionFilterOrFromJson(Map<String, dynamic> json) =>
    _$NotionFilterOr(
      (json['or'] as List<dynamic>)
          .map((e) =>
              const NotionFilterConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotionFilterOrToJson(_$NotionFilterOr instance) =>
    <String, dynamic>{
      'or': instance.or.map(const NotionFilterConverter().toJson).toList(),
      'runtimeType': instance.$type,
    };

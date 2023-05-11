// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_page_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionPageProperty _$$_NotionPagePropertyFromJson(
        Map<String, dynamic> json) =>
    _$_NotionPageProperty(
      id: json['id'] as String,
      type: json['type'] as String,
      title: (json['title'] as List<dynamic>?)
          ?.map((e) => NotionPropertyText.fromJson(e as Map<String, dynamic>))
          .toList(),
      richText: (json['rich_text'] as List<dynamic>?)
          ?.map((e) => NotionPropertyText.fromJson(e as Map<String, dynamic>))
          .toList(),
      select: json['select'] == null
          ? null
          : NotionPropertySelect.fromJson(
              json['select'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotionPagePropertyToJson(
        _$_NotionPageProperty instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title?.map((e) => e.toJson()).toList(),
      'rich_text': instance.richText?.map((e) => e.toJson()).toList(),
      'select': instance.select?.toJson(),
    };

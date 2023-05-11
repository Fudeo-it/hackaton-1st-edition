// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_page_property_title.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionPagePropertyTitle _$$_NotionPagePropertyTitleFromJson(
        Map<String, dynamic> json) =>
    _$_NotionPagePropertyTitle(
      id: json['id'] as String,
      type: json['type'] as String,
      title: (json['title'] as List<dynamic>)
          .map((e) => NotionRichText.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NotionPagePropertyTitleToJson(
        _$_NotionPagePropertyTitle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
    };

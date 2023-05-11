// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionPage _$$_NotionPageFromJson(Map<String, dynamic> json) =>
    _$_NotionPage(
      object: json['object'] as String,
      id: json['id'] as String,
      createdTime: json['created_time'] as String,
      lastEditedTime: json['last_edited_time'] as String,
      properties: (json['properties'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, NotionPageProperty.fromJson(e as Map<String, dynamic>)),
      ),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_NotionPageToJson(_$_NotionPage instance) =>
    <String, dynamic>{
      'object': instance.object,
      'id': instance.id,
      'created_time': instance.createdTime,
      'last_edited_time': instance.lastEditedTime,
      'properties': instance.properties,
      'url': instance.url,
    };

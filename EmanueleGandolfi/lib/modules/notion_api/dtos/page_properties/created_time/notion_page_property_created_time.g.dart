// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_page_property_created_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionPagePropertyCreatedTime _$$_NotionPagePropertyCreatedTimeFromJson(
        Map<String, dynamic> json) =>
    _$_NotionPagePropertyCreatedTime(
      id: json['id'] as String,
      type: json['type'] as String,
      createdTime: DateTime.parse(json['created_time'] as String),
    );

Map<String, dynamic> _$$_NotionPagePropertyCreatedTimeToJson(
        _$_NotionPagePropertyCreatedTime instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'created_time': instance.createdTime.toIso8601String(),
    };

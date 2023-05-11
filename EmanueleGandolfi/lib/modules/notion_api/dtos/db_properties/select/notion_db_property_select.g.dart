// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_db_property_select.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionDbPropertySelect _$$_NotionDbPropertySelectFromJson(
        Map<String, dynamic> json) =>
    _$_NotionDbPropertySelect(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      select: NotionDbPropertySelectOptions.fromJson(
          json['select'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotionDbPropertySelectToJson(
        _$_NotionDbPropertySelect instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'select': instance.select,
    };

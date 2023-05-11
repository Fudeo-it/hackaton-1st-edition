// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_page_property_select.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionPagePropertySelect _$$_NotionPagePropertySelectFromJson(
        Map<String, dynamic> json) =>
    _$_NotionPagePropertySelect(
      id: json['id'] as String,
      type: json['type'] as String,
      select: json['select'] == null
          ? null
          : NotionSelectOption.fromJson(json['select'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotionPagePropertySelectToJson(
        _$_NotionPagePropertySelect instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'select': instance.select,
    };

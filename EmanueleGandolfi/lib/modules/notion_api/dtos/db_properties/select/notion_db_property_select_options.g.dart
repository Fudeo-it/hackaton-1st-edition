// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_db_property_select_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionDbPropertySelectOptions _$$_NotionDbPropertySelectOptionsFromJson(
        Map<String, dynamic> json) =>
    _$_NotionDbPropertySelectOptions(
      options: (json['options'] as List<dynamic>)
          .map((e) => NotionSelectOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NotionDbPropertySelectOptionsToJson(
        _$_NotionDbPropertySelectOptions instance) =>
    <String, dynamic>{
      'options': instance.options,
    };

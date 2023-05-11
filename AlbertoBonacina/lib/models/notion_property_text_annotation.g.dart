// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_property_text_annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionPropertyTextAnnotation _$$_NotionPropertyTextAnnotationFromJson(
        Map<String, dynamic> json) =>
    _$_NotionPropertyTextAnnotation(
      bold: json['bold'] as bool,
      italic: json['italic'] as bool,
      strikethrough: json['strikethrough'] as bool,
      underline: json['underline'] as bool,
      code: json['code'] as bool,
      color: json['color'] as String,
    );

Map<String, dynamic> _$$_NotionPropertyTextAnnotationToJson(
        _$_NotionPropertyTextAnnotation instance) =>
    <String, dynamic>{
      'bold': instance.bold,
      'italic': instance.italic,
      'strikethrough': instance.strikethrough,
      'underline': instance.underline,
      'code': instance.code,
      'color': instance.color,
    };

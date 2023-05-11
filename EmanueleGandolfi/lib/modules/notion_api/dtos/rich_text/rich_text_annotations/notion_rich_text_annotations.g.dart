// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_rich_text_annotations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionRichTextAnnotations _$$_NotionRichTextAnnotationsFromJson(
        Map<String, dynamic> json) =>
    _$_NotionRichTextAnnotations(
      bold: json['bold'] as bool,
      italic: json['italic'] as bool,
      strikethrough: json['strikethrough'] as bool,
      underline: json['underline'] as bool,
      code: json['code'] as bool,
      color: json['color'] as String,
    );

Map<String, dynamic> _$$_NotionRichTextAnnotationsToJson(
        _$_NotionRichTextAnnotations instance) =>
    <String, dynamic>{
      'bold': instance.bold,
      'italic': instance.italic,
      'strikethrough': instance.strikethrough,
      'underline': instance.underline,
      'code': instance.code,
      'color': instance.color,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_rich_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotionRichTextTypeText _$$NotionRichTextTypeTextFromJson(
        Map<String, dynamic> json) =>
    _$NotionRichTextTypeText(
      NotionRichTextContentText.fromJson(json['text'] as Map<String, dynamic>),
      NotionRichTextAnnotations.fromJson(
          json['annotations'] as Map<String, dynamic>),
      json['plain_text'] as String,
      json['href'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$NotionRichTextTypeTextToJson(
        _$NotionRichTextTypeText instance) =>
    <String, dynamic>{
      'text': instance.text,
      'annotations': instance.annotations,
      'plain_text': instance.plainText,
      'href': instance.href,
      'type': instance.$type,
    };

_$NotionRichTextTypeMention _$$NotionRichTextTypeMentionFromJson(
        Map<String, dynamic> json) =>
    _$NotionRichTextTypeMention(
      json['mention'],
      NotionRichTextAnnotations.fromJson(
          json['annotations'] as Map<String, dynamic>),
      json['plainText'] as String,
      json['href'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$NotionRichTextTypeMentionToJson(
        _$NotionRichTextTypeMention instance) =>
    <String, dynamic>{
      'mention': instance.mention,
      'annotations': instance.annotations,
      'plainText': instance.plainText,
      'href': instance.href,
      'type': instance.$type,
    };

_$NotionRichTextTypeEquation _$$NotionRichTextTypeEquationFromJson(
        Map<String, dynamic> json) =>
    _$NotionRichTextTypeEquation(
      json['equation'],
      NotionRichTextAnnotations.fromJson(
          json['annotations'] as Map<String, dynamic>),
      json['plainText'] as String,
      json['href'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$NotionRichTextTypeEquationToJson(
        _$NotionRichTextTypeEquation instance) =>
    <String, dynamic>{
      'equation': instance.equation,
      'annotations': instance.annotations,
      'plainText': instance.plainText,
      'href': instance.href,
      'type': instance.$type,
    };

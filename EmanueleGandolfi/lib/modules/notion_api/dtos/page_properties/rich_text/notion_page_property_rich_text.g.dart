// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_page_property_rich_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionPagePropertyRichText _$$_NotionPagePropertyRichTextFromJson(
        Map<String, dynamic> json) =>
    _$_NotionPagePropertyRichText(
      id: json['id'] as String,
      type: json['type'] as String,
      richText: (json['rich_text'] as List<dynamic>)
          .map((e) => NotionRichText.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NotionPagePropertyRichTextToJson(
        _$_NotionPagePropertyRichText instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'rich_text': instance.richText,
    };

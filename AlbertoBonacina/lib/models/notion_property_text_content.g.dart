// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_property_text_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionPropertyTextContent _$$_NotionPropertyTextContentFromJson(
        Map<String, dynamic> json) =>
    _$_NotionPropertyTextContent(
      content: json['content'] as String,
      link: json['link'] == null
          ? null
          : NotionPropertyTextContentUrl.fromJson(
              json['link'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotionPropertyTextContentToJson(
        _$_NotionPropertyTextContent instance) =>
    <String, dynamic>{
      'content': instance.content,
      'link': instance.link,
    };

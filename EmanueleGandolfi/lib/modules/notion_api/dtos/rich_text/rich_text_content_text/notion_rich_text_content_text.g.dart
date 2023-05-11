// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_rich_text_content_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionRichTextContentText _$$_NotionRichTextContentTextFromJson(
        Map<String, dynamic> json) =>
    _$_NotionRichTextContentText(
      content: json['content'] as String,
      link: json['link'] == null
          ? null
          : NotionUrl.fromJson(json['link'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotionRichTextContentTextToJson(
        _$_NotionRichTextContentText instance) =>
    <String, dynamic>{
      'content': instance.content,
      'link': instance.link,
    };

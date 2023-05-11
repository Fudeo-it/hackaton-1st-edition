// ignore_for_file: prefer_const_constructors

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/notion_property_text_content_url.dart';

part 'notion_property_text_content.freezed.dart';
part 'notion_property_text_content.g.dart';

@freezed
class NotionPropertyTextContent with _$NotionPropertyTextContent {
  const factory NotionPropertyTextContent({
    required String content,
    NotionPropertyTextContentUrl? link,
  }) = _NotionPropertyTextContent;

  factory NotionPropertyTextContent.fromJson(Map<String, dynamic> json) =>
      _$NotionPropertyTextContentFromJson(json);
}

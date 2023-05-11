// ignore_for_file: prefer_const_constructors

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notion_property_text_content_url.freezed.dart';
part 'notion_property_text_content_url.g.dart';

@freezed
class NotionPropertyTextContentUrl with _$NotionPropertyTextContentUrl {
  const factory NotionPropertyTextContentUrl({
    required String url,
  }) = _NotionPropertyTextContentUrl;

  factory NotionPropertyTextContentUrl.fromJson(Map<String, dynamic> json) =>
      _$NotionPropertyTextContentUrlFromJson(json);
}

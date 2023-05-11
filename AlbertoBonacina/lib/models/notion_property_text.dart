// ignore_for_file: prefer_const_constructors

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/notion_property_text_annotation.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/notion_property_text_content.dart';

part 'notion_property_text.freezed.dart';
part 'notion_property_text.g.dart';

@freezed
class NotionPropertyText with _$NotionPropertyText {
  const factory NotionPropertyText({
    required String type,
    NotionPropertyTextContent? text,
    NotionPropertyTextAnnotation? annotations,
    @JsonKey(name: "plain_text") String? plainText,
    String? href,
  }) = _NotionPropertyText;

  factory NotionPropertyText.fromJson(Map<String, dynamic> json) =>
      _$NotionPropertyTextFromJson(json);
}

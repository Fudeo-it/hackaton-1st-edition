// ignore_for_file: prefer_const_constructors

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notion_property_text_annotation.freezed.dart';
part 'notion_property_text_annotation.g.dart';

@freezed
class NotionPropertyTextAnnotation with _$NotionPropertyTextAnnotation {
  const factory NotionPropertyTextAnnotation({
    required bool bold,
    required bool italic,
    required bool strikethrough,
    required bool underline,
    required bool code,
    required String color,
  }) = _NotionPropertyTextAnnotation;

  factory NotionPropertyTextAnnotation.fromJson(Map<String, dynamic> json) =>
      _$NotionPropertyTextAnnotationFromJson(json);
}

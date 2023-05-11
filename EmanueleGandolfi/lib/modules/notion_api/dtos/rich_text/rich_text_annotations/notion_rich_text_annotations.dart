import 'package:freezed_annotation/freezed_annotation.dart';

part 'notion_rich_text_annotations.freezed.dart';
part 'notion_rich_text_annotations.g.dart';

@freezed
class NotionRichTextAnnotations with _$NotionRichTextAnnotations {

  const factory NotionRichTextAnnotations({
    required bool bold,
    required bool italic,
    required bool strikethrough,
    required bool underline,
    required bool code,
    required String color,
  }) = _NotionRichTextAnnotations;

  factory NotionRichTextAnnotations.fromJson(Map<String, dynamic> json) => _$NotionRichTextAnnotationsFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/url/notion_url.dart';

part 'notion_rich_text_content_text.freezed.dart';
part 'notion_rich_text_content_text.g.dart';

@freezed
class NotionRichTextContentText with _$NotionRichTextContentText {

  const factory NotionRichTextContentText({
    required String content,
    required NotionUrl? link
  }) = _NotionRichTextContentText;

  factory NotionRichTextContentText.fromJson(Map<String, dynamic> json) => _$NotionRichTextContentTextFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/rich_text/rich_text_annotations/notion_rich_text_annotations.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/rich_text/rich_text_content_text/notion_rich_text_content_text.dart';

part 'notion_rich_text.freezed.dart';
part 'notion_rich_text.g.dart';

@Freezed(unionKey: 'type')
class NotionRichText with _$NotionRichText {

  @FreezedUnionValue('text')
  const factory NotionRichText.text(
    NotionRichTextContentText text,
    NotionRichTextAnnotations annotations,
    @JsonKey(name: 'plain_text')
    String plainText,
    String? href
  ) = NotionRichTextTypeText;

  @FreezedUnionValue('mention')
  const factory NotionRichText.mention(
    dynamic mention, // TODO parse and handle the mention object
    NotionRichTextAnnotations annotations,
    String plainText,
    String? href
  ) = NotionRichTextTypeMention;

  @FreezedUnionValue('equation')
  const factory NotionRichText.equation(
    dynamic equation, // TODO parse and handle the equation object
    NotionRichTextAnnotations annotations,
    String plainText,
    String? href
  ) = NotionRichTextTypeEquation;

  factory NotionRichText.fromJson(Map<String, dynamic> json) => _$NotionRichTextFromJson(json);
}
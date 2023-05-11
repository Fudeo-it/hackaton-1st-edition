import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/page_properties/notion_page_property.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/rich_text/notion_rich_text.dart';

part 'notion_page_property_rich_text.freezed.dart';
part 'notion_page_property_rich_text.g.dart';

@freezed
class NotionPagePropertyRichText with _$NotionPagePropertyRichText {

  @Implements<NotionPageProperty>()
  const factory NotionPagePropertyRichText({
    required String id,
    required String type,
    @JsonKey(name: 'rich_text')
    required List<NotionRichText> richText
  }) = _NotionPagePropertyRichText;

  factory NotionPagePropertyRichText.fromJson(Map<String, dynamic> json) => _$NotionPagePropertyRichTextFromJson(json);
}
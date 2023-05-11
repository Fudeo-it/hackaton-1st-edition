import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/page_properties/notion_page_property.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/rich_text/notion_rich_text.dart';

part 'notion_page_property_title.freezed.dart';
part 'notion_page_property_title.g.dart';

@freezed
class NotionPagePropertyTitle with _$NotionPagePropertyTitle {

  @Implements<NotionPageProperty>()
  const factory NotionPagePropertyTitle({
    required String id,
    required String type,
    required List<NotionRichText> title
  }) = _NotionPagePropertyTitle;

  factory NotionPagePropertyTitle.fromJson(Map<String, dynamic> json) => _$NotionPagePropertyTitleFromJson(json);
}
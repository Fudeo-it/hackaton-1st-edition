import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/page_properties/notion_page_property.dart';

part 'notion_page_property_url.freezed.dart';
part 'notion_page_property_url.g.dart';

@freezed
class NotionPagePropertyUrl with _$NotionPagePropertyUrl {

  @Implements<NotionPageProperty>()
  const factory NotionPagePropertyUrl({
    required String id,
    required String type,
    required String? url
  }) = _NotionPagePropertyUrl;

  factory NotionPagePropertyUrl.fromJson(Map<String, dynamic> json) => _$NotionPagePropertyUrlFromJson(json);
}
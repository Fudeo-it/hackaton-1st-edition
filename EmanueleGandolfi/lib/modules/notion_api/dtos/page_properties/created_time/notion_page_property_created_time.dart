import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/page_properties/notion_page_property.dart';

part 'notion_page_property_created_time.freezed.dart';
part 'notion_page_property_created_time.g.dart';

@freezed
class NotionPagePropertyCreatedTime with _$NotionPagePropertyCreatedTime {

  @Implements<NotionPageProperty>()
  const factory NotionPagePropertyCreatedTime({
    required String id,
    required String type,
    @JsonKey(name: 'created_time')
    required DateTime createdTime
  }) = _NotionPagePropertyCreatedTime;

  factory NotionPagePropertyCreatedTime.fromJson(Map<String, dynamic> json) => _$NotionPagePropertyCreatedTimeFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/filter/notion_filter.dart';

part 'notion_db_query_request.freezed.dart';
part 'notion_db_query_request.g.dart';

@freezed
class NotionDbQueryRequest with _$NotionDbQueryRequest {
  const factory NotionDbQueryRequest({
    @JsonKey(name: 'page_size')
    required int pageSize,
    @JsonKey(name: 'start_cursor', includeIfNull: false)
    String? startCursor,
    @JsonKey(includeIfNull: false)
    @NotionFilterConverter()
    NotionFilter? filter
  }) = _NotionDbQueryRequest;

  factory NotionDbQueryRequest.fromJson(Map<String, dynamic> json) => _$NotionDbQueryRequestFromJson(json);
}
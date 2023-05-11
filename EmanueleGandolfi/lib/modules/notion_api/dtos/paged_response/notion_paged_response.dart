import 'package:freezed_annotation/freezed_annotation.dart';

part 'notion_paged_response.freezed.dart';
part 'notion_paged_response.g.dart';

@Freezed(genericArgumentFactories: true)
class NotionPagedResponse<T> with _$NotionPagedResponse<T> {

  const factory NotionPagedResponse({
    required String object,
    required String type,
    required List<T> results,
    @JsonKey(name: 'next_cursor')
    required String? nextCursor,
    @JsonKey(name: 'has_more')
    required bool hasMore,
  }) = _NotionPagedResponse;

  factory NotionPagedResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) => _$NotionPagedResponseFromJson(json, fromJsonT);
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notion_database_response.freezed.dart';
part 'notion_database_response.g.dart';

@Freezed(genericArgumentFactories: true)
class NotionDatabaseResponse<T> with _$NotionDatabaseResponse<T> {
  const factory NotionDatabaseResponse({
    String? object,
    List<T>? results,
    String? nextCursor,
    bool? hasMore,
    String? type,
    String? developerSurvey,
  }) = _NotionDatabaseResponse;

  const NotionDatabaseResponse._();

  factory NotionDatabaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$NotionDatabaseResponseFromJson(json, fromJsonT);
}

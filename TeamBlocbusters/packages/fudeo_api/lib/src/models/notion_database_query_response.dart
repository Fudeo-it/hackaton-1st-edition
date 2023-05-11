import 'package:fudeo_api/src/models/deserializable.dart';
import 'package:fudeo_api/src/models/notion_page_response.dart';

class NotionDatabaseQueryResponse<T extends Deserializable>
    extends Deserializable {
  NotionDatabaseQueryResponse.fromJson(
    super.json,
    T Function(Map<String, dynamic>) fromJson,
  )   : object = json['object'] as String,
        page = json['page'] as Object,
        type = json['type'] as String,
        hasMore = json['has_more'] as bool,
        nextCursor = json['next_cursor'] as String?,
        results = (json['results'] as List<dynamic>)
            .map(
              (e) => NotionPageResponse.fromJson(
                e as Map<String, dynamic>,
                fromJson,
              ),
            )
            .toList(),
        super.fromJson();

  final String object;
  final Object page;
  final String type;
  final bool hasMore;
  final String? nextCursor;
  final List<NotionPageResponse<T>> results;
}

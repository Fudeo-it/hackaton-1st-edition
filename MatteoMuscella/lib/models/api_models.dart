import 'package:flutter/foundation.dart';

import 'app_models.dart';

class NotionApiResponse {
  List<Result> results = [];

  String? nextCursor;
  bool hasMore = false;

  NotionApiResponse(
      {this.results = const [], this.nextCursor, this.hasMore = false});

  NotionApiResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Result>[];
      json['results'].forEach((v) {
        results.add(Result.fromJson(v));
      });
    }
    nextCursor = json['next_cursor'];
    hasMore = json['has_more'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results.map((v) => v.toJson()).toList();
    data['next_cursor'] = nextCursor;
    data['has_more'] = hasMore;
    return data;
  }
}

class Result {
  String? id;
  String? createdTime;
  String? lastEditedTime;
  bool archived = false;
  String? url;
  Map<String, dynamic> properties = {};

  Result({
    this.id,
    this.createdTime,
    this.lastEditedTime,
    this.archived = false,
    this.url,
    this.properties = const {},
  });

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdTime = json['created_time'];
    lastEditedTime = json['last_edited_time'];
    archived = json['archived'];
    url = json['url'];
    properties = json['properties'] ?? {};
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_time'] = createdTime;
    data['last_edited_time'] = lastEditedTime;
    data['archived'] = archived;
    data['url'] = url;
    data['properties'] = properties;
    return data;
  }
}

class CreatedBy {
  String? object;
  String? id;

  CreatedBy({this.object, this.id});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['object'] = object;
    data['id'] = id;
    return data;
  }
}

class NotionQuery {
  String? startCursor;
  int pageSize;
  String searchQuery;

  /// Map with Notion Prop Name -> Notion Prop Type
  Map<String, String> properties;

  Map<String, dynamic> filters;

  NotionQuery(
      {this.startCursor,
      this.pageSize = 6,
      this.searchQuery = '',
      this.properties = const {},
      this.filters = const {}});

  /// Creates a filter Json in the style of Notion
  ///
  /// Example:
  /// {
  ///   "start_cursor: null,
  ///   "page_size": 6,
  ///   "filter": {
  ///     "or": [
  ///       {
  ///         "property": "Name",
  ///         "rich_text": {
  ///           "contains": "name"
  ///         }
  ///       }
  ///     ]
  ///   }
  /// }
  ///
  /// TODO: Improve code readability
  ///
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (startCursor != null) {
      data['start_cursor'] = startCursor;
    }
    data['page_size'] = pageSize;

    if (searchQuery.isNotEmpty) {
      var textProps = properties.entries
          .where((x) => ['rich_text', 'title'].contains(x.value));

      /// Creates a list of objects in the style of Notion property filter
      /// { property: <name of prop>, contains: <value to the check> }
      /// I am using always `contains` as the property I am checking are all textual.
      var conditions = textProps.fold(
          [],
          (conds, x) => [
                ...conds,
                {
                  'property': x.key,
                  x.value: {'contains': searchQuery}
                }
              ]);

      /// Here I put all the conditions in OR
      var filters = {'or': conditions};
      debugPrint('Filters: $filters');
      data['filter'] = filters;
    }

    if (filters.isNotEmpty) {
      var conditions = [];

      for (var e in filters.entries) {
        if (e.key == 'publishDate') {
          // TODO: How to generalize this - e.g. avoid putting key 'Job Posted'?
          if (e.value == PublishDate.thisWeek) {
            conditions.add({
              'property': 'Job Posted',
              'date': {'this_week': {}}
            });
          }
          if (e.value == PublishDate.lastWeek) {
            conditions.add({
              'property': 'Job Posted',
              'date': {'last_week': {}}
            });
          }
          if (e.value == PublishDate.lastMonth) {
            conditions.add({
              'property': 'Job Posted',
              'date': {'past_month': {}}
            });
          }
          if (e.value == PublishDate.last6Months) {
            conditions.add({
              'property': 'Job Posted',
              'date': {
                'on_or_after':
                    DateTime.now().subtract(const Duration(days: 6 * 30))
              }
            });
          }
        }
      }

      if (conditions.isNotEmpty) {
        if (data['filter'] == null) {
          data['filter'] = {'or': conditions};
        } else {
          data['filter'] = {
            'or': [...data['filter']['or'], conditions]
          };
        }
      }
    }

    return data;
  }
}

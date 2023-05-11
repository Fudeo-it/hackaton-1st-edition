// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_db_query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionDbQueryRequest _$$_NotionDbQueryRequestFromJson(
        Map<String, dynamic> json) =>
    _$_NotionDbQueryRequest(
      pageSize: json['page_size'] as int,
      startCursor: json['start_cursor'] as String?,
      filter: _$JsonConverterFromJson<Map<String, dynamic>, NotionFilter>(
          json['filter'], const NotionFilterConverter().fromJson),
    );

Map<String, dynamic> _$$_NotionDbQueryRequestToJson(
    _$_NotionDbQueryRequest instance) {
  final val = <String, dynamic>{
    'page_size': instance.pageSize,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('start_cursor', instance.startCursor);
  writeNotNull(
      'filter',
      _$JsonConverterToJson<Map<String, dynamic>, NotionFilter>(
          instance.filter, const NotionFilterConverter().toJson));
  return val;
}

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

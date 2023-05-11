// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_paged_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionPagedResponse<T> _$$_NotionPagedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_NotionPagedResponse<T>(
      object: json['object'] as String,
      type: json['type'] as String,
      results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
      nextCursor: json['next_cursor'] as String?,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$$_NotionPagedResponseToJson<T>(
  _$_NotionPagedResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'object': instance.object,
      'type': instance.type,
      'results': instance.results.map(toJsonT).toList(),
      'next_cursor': instance.nextCursor,
      'has_more': instance.hasMore,
    };

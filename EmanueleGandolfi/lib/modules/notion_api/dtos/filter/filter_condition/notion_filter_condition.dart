import 'package:freezed_annotation/freezed_annotation.dart';

part 'notion_filter_condition.freezed.dart';
part 'notion_filter_condition.g.dart';

@freezed
class NotionFilterCondition with _$NotionFilterCondition {

  const factory NotionFilterCondition.equals(
    String equals,
  ) = NotionFilterConditionEquals;

  const factory NotionFilterCondition.contains(
    String contains,
  ) = NotionFilterConditionContains;

  factory NotionFilterCondition.fromJson(Map<String, dynamic> json) => _$NotionFilterConditionFromJson(json);
}

class NotionFilterConditionConverter implements JsonConverter<NotionFilterCondition, Map<String, dynamic>> {
  const NotionFilterConditionConverter();

  @override
  NotionFilterCondition fromJson(Map<String, dynamic> json) => NotionFilterCondition.fromJson(json);

  @override
  Map<String, dynamic> toJson(NotionFilterCondition data) => data.toJson()..remove('runtimeType');
}
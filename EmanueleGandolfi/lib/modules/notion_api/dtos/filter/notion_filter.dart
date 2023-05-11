import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/filter/filter_condition/notion_filter_condition.dart';

part 'notion_filter.freezed.dart';
part 'notion_filter.g.dart';

@freezed
class NotionFilter with _$NotionFilter {

  const factory NotionFilter.select(
    String property,
    @NotionFilterConditionConverter()
    NotionFilterCondition select
  ) = NotionFilterSelect;

  const factory NotionFilter.richText(
    String property,
    @JsonKey(name: 'rich_text')
    @NotionFilterConditionConverter()
    NotionFilterCondition richText
  ) = NotionFilterRichText;

  const factory NotionFilter.and(
    @NotionFilterConverter()
    List<NotionFilter> and
  ) = NotionFilterAnd;

  const factory NotionFilter.or(
    @NotionFilterConverter()
    List<NotionFilter> or
  ) = NotionFilterOr;

  factory NotionFilter.fromJson(Map<String, dynamic> json) => _$NotionFilterFromJson(json);
}

class NotionFilterConverter implements JsonConverter<NotionFilter, Map<String, dynamic>> {
  const NotionFilterConverter();

  @override
  NotionFilter fromJson(Map<String, dynamic> json) => NotionFilter.fromJson(json);

  @override
  Map<String, dynamic> toJson(NotionFilter data) => data.toJson()..remove('runtimeType');
}
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/db_properties/notion_db_property.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/db_properties/select/notion_db_property_select_options.dart';

part 'notion_db_property_select.freezed.dart';
part 'notion_db_property_select.g.dart';

@freezed
class NotionDbPropertySelect with _$NotionDbPropertySelect {

  @Implements<NotionDbProperty>()
  const factory NotionDbPropertySelect({
    required String id,
    required String name,
    required String type,
    required NotionDbPropertySelectOptions select
  }) = _NotionDbPropertySelect;

  factory NotionDbPropertySelect.fromJson(Map<String, dynamic> json) => _$NotionDbPropertySelectFromJson(json);
}
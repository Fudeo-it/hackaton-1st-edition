import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/page_properties/notion_page_property.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/select_option/notion_select_option.dart';

part 'notion_page_property_select.freezed.dart';
part 'notion_page_property_select.g.dart';

@freezed
class NotionPagePropertySelect with _$NotionPagePropertySelect {

  @Implements<NotionPageProperty>()
  const factory NotionPagePropertySelect({
    required String id,
    required String type,
    required NotionSelectOption? select
  }) = _NotionPagePropertySelect;

  factory NotionPagePropertySelect.fromJson(Map<String, dynamic> json) => _$NotionPagePropertySelectFromJson(json);
}
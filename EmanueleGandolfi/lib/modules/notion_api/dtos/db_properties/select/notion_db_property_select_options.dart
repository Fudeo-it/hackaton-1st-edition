import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/select_option/notion_select_option.dart';

part 'notion_db_property_select_options.freezed.dart';
part 'notion_db_property_select_options.g.dart';

@freezed
class NotionDbPropertySelectOptions with _$NotionDbPropertySelectOptions {

  const factory NotionDbPropertySelectOptions({
    required List<NotionSelectOption> options
  }) = _NotionDbPropertySelectOptions;

  factory NotionDbPropertySelectOptions.fromJson(Map<String, dynamic> json) => _$NotionDbPropertySelectOptionsFromJson(json);
}
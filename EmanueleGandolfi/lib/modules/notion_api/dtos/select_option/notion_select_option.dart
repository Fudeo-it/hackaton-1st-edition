import 'package:freezed_annotation/freezed_annotation.dart';

part 'notion_select_option.freezed.dart';
part 'notion_select_option.g.dart';

@freezed
class NotionSelectOption with _$NotionSelectOption {

  const factory NotionSelectOption({
    required String id,
    required String name,
    required String color,
  }) = _NotionSelectOption;

  factory NotionSelectOption.fromJson(Map<String, dynamic> json) => _$NotionSelectOptionFromJson(json);
}
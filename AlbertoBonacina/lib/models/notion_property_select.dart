// ignore_for_file: prefer_const_constructors

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notion_property_select.freezed.dart';
part 'notion_property_select.g.dart';

@freezed
class NotionPropertySelect with _$NotionPropertySelect {
  const factory NotionPropertySelect({
    required String id,
    required String name,
    required String color,
  }) = _NotionPropertySelect;

  factory NotionPropertySelect.fromJson(Map<String, dynamic> json) =>
      _$NotionPropertySelectFromJson(json);
}

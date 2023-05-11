// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, invalid_annotation_target

//import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/notion_property_select.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/notion_property_text.dart';

part 'notion_page_property.freezed.dart';
part 'notion_page_property.g.dart';

@freezed
class NotionPageProperty with _$NotionPageProperty {
  @JsonSerializable(explicitToJson: true)
  const factory NotionPageProperty({
    required String id,
    required String type,
    List<NotionPropertyText>? title,
    @JsonKey(name: "rich_text") List<NotionPropertyText>? richText,
    NotionPropertySelect? select,
  }) = _NotionPageProperty;

  factory NotionPageProperty.fromJson(Map<String, dynamic> json) =>
      _$NotionPagePropertyFromJson(json);
}

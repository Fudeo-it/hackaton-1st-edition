// ignore_for_file: prefer_const_constructors, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/notion_page_property.dart';

part 'notion_page.freezed.dart';
part 'notion_page.g.dart';

@Freezed(genericArgumentFactories: true)
class NotionPage with _$NotionPage {
  const factory NotionPage({
    required String object,
    required String id,
    @JsonKey(name: "created_time") required String createdTime,
    @JsonKey(name: "last_edited_time") required String lastEditedTime,
    //TODO cover, icon, parent, archived
    Map<String, NotionPageProperty>? properties,
    String? url,
  }) = _NotionPage;

  factory NotionPage.fromJson(Map<String, dynamic> json) =>
      _$NotionPageFromJson(json);
}

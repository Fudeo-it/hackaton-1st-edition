import 'package:freezed_annotation/freezed_annotation.dart';

part 'notion_url.freezed.dart';
part 'notion_url.g.dart';

@freezed
class NotionUrl with _$NotionUrl {

  const factory NotionUrl({
    required String url,
  }) = _NotionUrl;

  factory NotionUrl.fromJson(Map<String, dynamic> json) => _$NotionUrlFromJson(json);
}
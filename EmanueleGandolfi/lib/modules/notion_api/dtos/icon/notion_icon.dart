import 'package:freezed_annotation/freezed_annotation.dart';

part 'notion_icon.freezed.dart';
part 'notion_icon.g.dart';

@Freezed(unionKey: 'type')
class NotionIcon with _$NotionIcon {

  @FreezedUnionValue('emoji')
  const factory NotionIcon.emoji(
    String emoji
  ) = NotionIconEmoji;

  @FreezedUnionValue('external')
  const factory NotionIcon.external(
    String url
  ) = NotionIconExternal;

  factory NotionIcon.fromJson(Map<String, dynamic> json) => _$NotionIconFromJson(json);
}
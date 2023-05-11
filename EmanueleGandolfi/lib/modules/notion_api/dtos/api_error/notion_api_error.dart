import 'package:freezed_annotation/freezed_annotation.dart';

part 'notion_api_error.freezed.dart';
part 'notion_api_error.g.dart';

@freezed
class NotionApiError with _$NotionApiError {

  const factory NotionApiError({
    required String code,
    required String message,
  }) = _NotionApiError;

  factory NotionApiError.fromJson(Map<String, dynamic> json) => _$NotionApiErrorFromJson(json);

}
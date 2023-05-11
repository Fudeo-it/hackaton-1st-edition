import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/dtos/notion_db_hiring_job_offer_properties/notion_db_hiring_job_offer_properties.dart';

part 'notion_db_hiring_job_offer.freezed.dart';
part 'notion_db_hiring_job_offer.g.dart';

@freezed
class NotionDbHiringJobOffer with _$NotionDbHiringJobOffer {

  const factory NotionDbHiringJobOffer({
    required String id,
    @JsonKey(name: 'created_time')
    required DateTime createdTime,
    @JsonKey(name: 'last_edited_time')
    required DateTime lastEditedTime,
    required NotionDbHiringJobOfferProperties properties
  }) = _NotionDbHiringJobOffer;

  factory NotionDbHiringJobOffer.fromJson(Map<String, dynamic> json) => _$NotionDbHiringJobOfferFromJson(json);
}
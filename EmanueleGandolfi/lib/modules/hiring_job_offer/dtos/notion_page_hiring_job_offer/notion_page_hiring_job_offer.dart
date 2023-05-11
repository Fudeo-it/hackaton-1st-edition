import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/dtos/notion_page_hiring_job_offer_properties/notion_page_hiring_job_offer_properties.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/icon/notion_icon.dart';

part 'notion_page_hiring_job_offer.freezed.dart';
part 'notion_page_hiring_job_offer.g.dart';

@freezed
class NotionPageHiringJobOffer with _$NotionPageHiringJobOffer {

  const factory NotionPageHiringJobOffer({
    required String id,
    @JsonKey(name: 'created_time')
    required DateTime createdTime,
    @JsonKey(name: 'last_edited_time')
    required DateTime lastEditedTime,
    required bool archived,
    NotionIcon? icon,
    required String url,
    required NotionPageHiringJobOfferProperties properties
  }) = _NotionPageHiringJobOffer;

  factory NotionPageHiringJobOffer.fromJson(Map<String, dynamic> json) => _$NotionPageHiringJobOfferFromJson(json);
}
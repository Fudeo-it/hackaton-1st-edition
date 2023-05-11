import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/dtos/notion_page_freelance_job_offer_properties/notion_page_freelance_job_offer_properties.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/icon/notion_icon.dart';

part 'notion_page_freelance_job_offer.freezed.dart';
part 'notion_page_freelance_job_offer.g.dart';

@freezed
class NotionPageFreelanceJobOffer with _$NotionPageFreelanceJobOffer {

  const factory NotionPageFreelanceJobOffer({
    required String id,
    @JsonKey(name: 'created_time')
    required DateTime createdTime,
    @JsonKey(name: 'last_edited_time')
    required DateTime lastEditedTime,
    required bool archived,
    NotionIcon? icon,
    required String url,
    required NotionPageFreelanceJobOfferProperties properties
  }) = _NotionPageFreelanceJobOffer;

  factory NotionPageFreelanceJobOffer.fromJson(Map<String, dynamic> json) => _$NotionPageFreelanceJobOfferFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/dtos/notion_db_freelance_job_offer_properties/notion_db_freelance_job_offer_properties.dart';

part 'notion_db_freelance_job_offer.freezed.dart';
part 'notion_db_freelance_job_offer.g.dart';

@freezed
class NotionDbFreelanceJobOffer with _$NotionDbFreelanceJobOffer {

  const factory NotionDbFreelanceJobOffer({
    required String id,
    @JsonKey(name: 'created_time')
    required DateTime createdTime,
    @JsonKey(name: 'last_edited_time')
    required DateTime lastEditedTime,
    required NotionDbFreelanceJobOfferProperties properties
  }) = _NotionDbFreelanceJobOffer;

  factory NotionDbFreelanceJobOffer.fromJson(Map<String, dynamic> json) => _$NotionDbFreelanceJobOfferFromJson(json);
}
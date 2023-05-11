import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/db_properties/select/notion_db_property_select.dart';

part 'notion_db_freelance_job_offer_properties.freezed.dart';
part 'notion_db_freelance_job_offer_properties.g.dart';

@freezed
class NotionDbFreelanceJobOfferProperties with _$NotionDbFreelanceJobOfferProperties {

  const factory NotionDbFreelanceJobOfferProperties({
    @JsonKey(name: 'NDA')
    required NotionDbPropertySelect? nda,
    @JsonKey(name: 'Tipo di relazione')
    required NotionDbPropertySelect? tipoDiRelazione,
  }) = _NotionDbFreelanceJobOfferProperties;

  factory NotionDbFreelanceJobOfferProperties.fromJson(Map<String, dynamic> json) => _$NotionDbFreelanceJobOfferPropertiesFromJson(json);
}
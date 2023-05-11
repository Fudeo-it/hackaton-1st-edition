import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/db_properties/select/notion_db_property_select.dart';

part 'notion_db_hiring_job_offer_properties.freezed.dart';
part 'notion_db_hiring_job_offer_properties.g.dart';

@freezed
class NotionDbHiringJobOfferProperties with _$NotionDbHiringJobOfferProperties {

  const factory NotionDbHiringJobOfferProperties({
    @JsonKey(name: 'Team')
    required NotionDbPropertySelect? team,
    @JsonKey(name: 'Contratto')
    required NotionDbPropertySelect? contratto,
    @JsonKey(name: 'Seniority')
    required NotionDbPropertySelect? seniority,
    @JsonKey(name: 'RAL')
    required NotionDbPropertySelect? ral,
  }) = _NotionDbHiringJobOfferProperties;

  factory NotionDbHiringJobOfferProperties.fromJson(Map<String, dynamic> json) => _$NotionDbHiringJobOfferPropertiesFromJson(json);
}
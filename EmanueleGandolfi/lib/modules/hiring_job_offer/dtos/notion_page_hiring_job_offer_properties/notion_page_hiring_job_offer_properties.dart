import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/page_properties/created_time/notion_page_property_created_time.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/page_properties/rich_text/notion_page_property_rich_text.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/page_properties/select/notion_page_property_select.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/page_properties/title/notion_page_property_title.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/page_properties/url/notion_page_property_url.dart';

part 'notion_page_hiring_job_offer_properties.freezed.dart';
part 'notion_page_hiring_job_offer_properties.g.dart';

@freezed
class NotionPageHiringJobOfferProperties with _$NotionPageHiringJobOfferProperties {

  const factory NotionPageHiringJobOfferProperties({
    @JsonKey(name: 'Job Posted')
    required NotionPagePropertyCreatedTime? jobPosted,
    @JsonKey(name: 'Team')
    required NotionPagePropertySelect? team,
    @JsonKey(name: 'Contratto')
    required NotionPagePropertySelect? contratto,
    @JsonKey(name: 'Seniority')
    required NotionPagePropertySelect? seniority,
    @JsonKey(name: 'RAL')
    required NotionPagePropertySelect? ral,
    @JsonKey(name: 'Name')
    required NotionPagePropertyTitle? name,
    @JsonKey(name: 'Qualifica')
    required NotionPagePropertyRichText? qualifica,
    @JsonKey(name: 'Retribuzione')
    required NotionPagePropertyRichText? retribuzione,
    @JsonKey(name: 'Descrizione offerta')
    required NotionPagePropertyRichText? descrizioneOfferta,
    @JsonKey(name: 'Come candidarsi')
    required NotionPagePropertyRichText? comeCandidarsi,
    @JsonKey(name: 'Località')
    required NotionPagePropertyRichText? localita,
    @JsonKey(name: 'Nome azienda')
    required NotionPagePropertyRichText? nomeAzienda,
    @JsonKey(name: 'Stato di pubblicazione')
    required NotionPagePropertyRichText? statoDiPubblicazione,
    @JsonKey(name: 'URL sito web')
    required NotionPagePropertyUrl? urlSitoWeb,
  }) = _NotionPageHiringJobOfferProperties;

  factory NotionPageHiringJobOfferProperties.fromJson(Map<String, dynamic> json) => _$NotionPageHiringJobOfferPropertiesFromJson(json);
}
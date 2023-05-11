
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/page_properties/created_time/notion_page_property_created_time.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/page_properties/rich_text/notion_page_property_rich_text.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/page_properties/select/notion_page_property_select.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/page_properties/title/notion_page_property_title.dart';

part 'notion_page_freelance_job_offer_properties.freezed.dart';
part 'notion_page_freelance_job_offer_properties.g.dart';

@freezed
class NotionPageFreelanceJobOfferProperties with _$NotionPageFreelanceJobOfferProperties {
  const factory NotionPageFreelanceJobOfferProperties({
    @JsonKey(name: 'Tempistiche')
    required NotionPagePropertyRichText? tempistiche,
    @JsonKey(name: 'Job Posted')
    required NotionPagePropertyCreatedTime? jobPosted,
    @JsonKey(name: 'Come candidarsi')
    required NotionPagePropertyRichText? comeCandidarsi,
    @JsonKey(name: 'Richiesta di lavoro')
    required NotionPagePropertyRichText? richiestaDiLavoro,
    @JsonKey(name: 'Budget')
    required NotionPagePropertyRichText? budget,
    @JsonKey(name: 'NDA')
    required NotionPagePropertySelect? nda,
    @JsonKey(name: 'Codice')
    required NotionPagePropertyTitle? codice,
    @JsonKey(name: 'Tempistiche di pagamento')
    required NotionPagePropertyRichText? tempisticheDiPagamento,
    @JsonKey(name: 'Descrizione del progetto')
    required NotionPagePropertyRichText? descrizioneDelProgetto,
    @JsonKey(name: 'Tipo di relazione')
    required NotionPagePropertySelect? tipoDiRelazione,
  }) = _NotionPageFreelanceJobOfferProperties;

  factory NotionPageFreelanceJobOfferProperties.fromJson(Map<String, dynamic> json) => _$NotionPageFreelanceJobOfferPropertiesFromJson(json);
}
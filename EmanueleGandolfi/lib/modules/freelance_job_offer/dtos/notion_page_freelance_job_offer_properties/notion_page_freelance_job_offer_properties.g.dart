// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_page_freelance_job_offer_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionPageFreelanceJobOfferProperties
    _$$_NotionPageFreelanceJobOfferPropertiesFromJson(
            Map<String, dynamic> json) =>
        _$_NotionPageFreelanceJobOfferProperties(
          tempistiche: json['Tempistiche'] == null
              ? null
              : NotionPagePropertyRichText.fromJson(
                  json['Tempistiche'] as Map<String, dynamic>),
          jobPosted: json['Job Posted'] == null
              ? null
              : NotionPagePropertyCreatedTime.fromJson(
                  json['Job Posted'] as Map<String, dynamic>),
          comeCandidarsi: json['Come candidarsi'] == null
              ? null
              : NotionPagePropertyRichText.fromJson(
                  json['Come candidarsi'] as Map<String, dynamic>),
          richiestaDiLavoro: json['Richiesta di lavoro'] == null
              ? null
              : NotionPagePropertyRichText.fromJson(
                  json['Richiesta di lavoro'] as Map<String, dynamic>),
          budget: json['Budget'] == null
              ? null
              : NotionPagePropertyRichText.fromJson(
                  json['Budget'] as Map<String, dynamic>),
          nda: json['NDA'] == null
              ? null
              : NotionPagePropertySelect.fromJson(
                  json['NDA'] as Map<String, dynamic>),
          codice: json['Codice'] == null
              ? null
              : NotionPagePropertyTitle.fromJson(
                  json['Codice'] as Map<String, dynamic>),
          tempisticheDiPagamento: json['Tempistiche di pagamento'] == null
              ? null
              : NotionPagePropertyRichText.fromJson(
                  json['Tempistiche di pagamento'] as Map<String, dynamic>),
          descrizioneDelProgetto: json['Descrizione del progetto'] == null
              ? null
              : NotionPagePropertyRichText.fromJson(
                  json['Descrizione del progetto'] as Map<String, dynamic>),
          tipoDiRelazione: json['Tipo di relazione'] == null
              ? null
              : NotionPagePropertySelect.fromJson(
                  json['Tipo di relazione'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_NotionPageFreelanceJobOfferPropertiesToJson(
        _$_NotionPageFreelanceJobOfferProperties instance) =>
    <String, dynamic>{
      'Tempistiche': instance.tempistiche,
      'Job Posted': instance.jobPosted,
      'Come candidarsi': instance.comeCandidarsi,
      'Richiesta di lavoro': instance.richiestaDiLavoro,
      'Budget': instance.budget,
      'NDA': instance.nda,
      'Codice': instance.codice,
      'Tempistiche di pagamento': instance.tempisticheDiPagamento,
      'Descrizione del progetto': instance.descrizioneDelProgetto,
      'Tipo di relazione': instance.tipoDiRelazione,
    };

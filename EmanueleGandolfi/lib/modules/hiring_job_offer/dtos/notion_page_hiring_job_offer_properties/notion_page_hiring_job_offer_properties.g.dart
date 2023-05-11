// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_page_hiring_job_offer_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionPageHiringJobOfferProperties
    _$$_NotionPageHiringJobOfferPropertiesFromJson(Map<String, dynamic> json) =>
        _$_NotionPageHiringJobOfferProperties(
          jobPosted: json['Job Posted'] == null
              ? null
              : NotionPagePropertyCreatedTime.fromJson(
                  json['Job Posted'] as Map<String, dynamic>),
          team: json['Team'] == null
              ? null
              : NotionPagePropertySelect.fromJson(
                  json['Team'] as Map<String, dynamic>),
          contratto: json['Contratto'] == null
              ? null
              : NotionPagePropertySelect.fromJson(
                  json['Contratto'] as Map<String, dynamic>),
          seniority: json['Seniority'] == null
              ? null
              : NotionPagePropertySelect.fromJson(
                  json['Seniority'] as Map<String, dynamic>),
          ral: json['RAL'] == null
              ? null
              : NotionPagePropertySelect.fromJson(
                  json['RAL'] as Map<String, dynamic>),
          name: json['Name'] == null
              ? null
              : NotionPagePropertyTitle.fromJson(
                  json['Name'] as Map<String, dynamic>),
          qualifica: json['Qualifica'] == null
              ? null
              : NotionPagePropertyRichText.fromJson(
                  json['Qualifica'] as Map<String, dynamic>),
          retribuzione: json['Retribuzione'] == null
              ? null
              : NotionPagePropertyRichText.fromJson(
                  json['Retribuzione'] as Map<String, dynamic>),
          descrizioneOfferta: json['Descrizione offerta'] == null
              ? null
              : NotionPagePropertyRichText.fromJson(
                  json['Descrizione offerta'] as Map<String, dynamic>),
          comeCandidarsi: json['Come candidarsi'] == null
              ? null
              : NotionPagePropertyRichText.fromJson(
                  json['Come candidarsi'] as Map<String, dynamic>),
          localita: json['Località'] == null
              ? null
              : NotionPagePropertyRichText.fromJson(
                  json['Località'] as Map<String, dynamic>),
          nomeAzienda: json['Nome azienda'] == null
              ? null
              : NotionPagePropertyRichText.fromJson(
                  json['Nome azienda'] as Map<String, dynamic>),
          statoDiPubblicazione: json['Stato di pubblicazione'] == null
              ? null
              : NotionPagePropertyRichText.fromJson(
                  json['Stato di pubblicazione'] as Map<String, dynamic>),
          urlSitoWeb: json['URL sito web'] == null
              ? null
              : NotionPagePropertyUrl.fromJson(
                  json['URL sito web'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_NotionPageHiringJobOfferPropertiesToJson(
        _$_NotionPageHiringJobOfferProperties instance) =>
    <String, dynamic>{
      'Job Posted': instance.jobPosted,
      'Team': instance.team,
      'Contratto': instance.contratto,
      'Seniority': instance.seniority,
      'RAL': instance.ral,
      'Name': instance.name,
      'Qualifica': instance.qualifica,
      'Retribuzione': instance.retribuzione,
      'Descrizione offerta': instance.descrizioneOfferta,
      'Come candidarsi': instance.comeCandidarsi,
      'Località': instance.localita,
      'Nome azienda': instance.nomeAzienda,
      'Stato di pubblicazione': instance.statoDiPubblicazione,
      'URL sito web': instance.urlSitoWeb,
    };

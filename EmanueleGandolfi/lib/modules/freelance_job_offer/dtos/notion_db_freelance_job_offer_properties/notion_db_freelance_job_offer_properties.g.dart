// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_db_freelance_job_offer_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionDbFreelanceJobOfferProperties
    _$$_NotionDbFreelanceJobOfferPropertiesFromJson(
            Map<String, dynamic> json) =>
        _$_NotionDbFreelanceJobOfferProperties(
          nda: json['NDA'] == null
              ? null
              : NotionDbPropertySelect.fromJson(
                  json['NDA'] as Map<String, dynamic>),
          tipoDiRelazione: json['Tipo di relazione'] == null
              ? null
              : NotionDbPropertySelect.fromJson(
                  json['Tipo di relazione'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_NotionDbFreelanceJobOfferPropertiesToJson(
        _$_NotionDbFreelanceJobOfferProperties instance) =>
    <String, dynamic>{
      'NDA': instance.nda,
      'Tipo di relazione': instance.tipoDiRelazione,
    };

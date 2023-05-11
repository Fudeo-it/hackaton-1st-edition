// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_db_hiring_job_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionDbHiringJobOffer _$$_NotionDbHiringJobOfferFromJson(
        Map<String, dynamic> json) =>
    _$_NotionDbHiringJobOffer(
      id: json['id'] as String,
      createdTime: DateTime.parse(json['created_time'] as String),
      lastEditedTime: DateTime.parse(json['last_edited_time'] as String),
      properties: NotionDbHiringJobOfferProperties.fromJson(
          json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotionDbHiringJobOfferToJson(
        _$_NotionDbHiringJobOffer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_time': instance.createdTime.toIso8601String(),
      'last_edited_time': instance.lastEditedTime.toIso8601String(),
      'properties': instance.properties,
    };

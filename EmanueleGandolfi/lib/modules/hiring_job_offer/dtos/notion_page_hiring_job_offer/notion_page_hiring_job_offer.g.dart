// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_page_hiring_job_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionPageHiringJobOffer _$$_NotionPageHiringJobOfferFromJson(
        Map<String, dynamic> json) =>
    _$_NotionPageHiringJobOffer(
      id: json['id'] as String,
      createdTime: DateTime.parse(json['created_time'] as String),
      lastEditedTime: DateTime.parse(json['last_edited_time'] as String),
      archived: json['archived'] as bool,
      icon: json['icon'] == null
          ? null
          : NotionIcon.fromJson(json['icon'] as Map<String, dynamic>),
      url: json['url'] as String,
      properties: NotionPageHiringJobOfferProperties.fromJson(
          json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotionPageHiringJobOfferToJson(
        _$_NotionPageHiringJobOffer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_time': instance.createdTime.toIso8601String(),
      'last_edited_time': instance.lastEditedTime.toIso8601String(),
      'archived': instance.archived,
      'icon': instance.icon,
      'url': instance.url,
      'properties': instance.properties,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recruitment _$RecruitmentFromJson(Map<String, dynamic> json) => Recruitment(
      companyName: (json['companyName'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      urlWebsite: json['urlWebsite'] as String?,
      qualification: (json['qualification'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      seniority: json['seniority'] == null
          ? null
          : Detail.fromJson(json['seniority'] as Map<String, dynamic>),
      team: json['team'] == null
          ? null
          : Detail.fromJson(json['team'] as Map<String, dynamic>),
      contract: json['contract'] == null
          ? null
          : Detail.fromJson(json['contract'] as Map<String, dynamic>),
      pay: (json['pay'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      ral: json['ral'] as String?,
      offerDescription: (json['offerDescription'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      locality: (json['locality'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      name: json['name'] as String?,
      image: json['image'] as String?,
      posted: json['posted'] == null
          ? null
          : DateTime.parse(json['posted'] as String),
      archived: json['archived'] as bool,
      candidature: json['candidature'] as String?,
      target: $enumDecode(_$TargetJobOfferEnumMap, json['target']),
      url: json['url'] as String,
    );

Map<String, dynamic> _$RecruitmentToJson(Recruitment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'posted': instance.posted?.toIso8601String(),
      'archived': instance.archived,
      'candidature': instance.candidature,
      'target': _$TargetJobOfferEnumMap[instance.target]!,
      'url': instance.url,
      'companyName': instance.companyName,
      'urlWebsite': instance.urlWebsite,
      'qualification': instance.qualification,
      'seniority': instance.seniority,
      'team': instance.team,
      'contract': instance.contract,
      'pay': instance.pay,
      'ral': instance.ral,
      'offerDescription': instance.offerDescription,
      'locality': instance.locality,
    };

const _$TargetJobOfferEnumMap = {
  TargetJobOffer.recruitment: 'recruitment',
  TargetJobOffer.freelance: 'freelance',
};

Freelance _$FreelanceFromJson(Map<String, dynamic> json) => Freelance(
      id: json['id'] as String,
      name: json['name'] as String?,
      image: json['image'] as String?,
      posted: json['posted'] == null
          ? null
          : DateTime.parse(json['posted'] as String),
      archived: json['archived'] as bool,
      candidature: json['candidature'] as String?,
      target: $enumDecode(_$TargetJobOfferEnumMap, json['target']),
      url: json['url'] as String,
      projectDescription: (json['projectDescription'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      workRequest: (json['workRequest'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      relationshipType: json['relationshipType'] == null
          ? null
          : Detail.fromJson(json['relationshipType'] as Map<String, dynamic>),
      timing: (json['timing'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      budget: (json['budget'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentTimes: (json['paymentTimes'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      nda: json['nda'] == null
          ? null
          : Detail.fromJson(json['nda'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FreelanceToJson(Freelance instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'posted': instance.posted?.toIso8601String(),
      'archived': instance.archived,
      'candidature': instance.candidature,
      'target': _$TargetJobOfferEnumMap[instance.target]!,
      'url': instance.url,
      'projectDescription': instance.projectDescription,
      'workRequest': instance.workRequest,
      'relationshipType': instance.relationshipType,
      'timing': instance.timing,
      'budget': instance.budget,
      'paymentTimes': instance.paymentTimes,
      'nda': instance.nda,
    };

Description _$DescriptionFromJson(Map<String, dynamic> json) => Description(
      text: json['text'] as String,
      annotations:
          Annotation.fromJson(json['annotations'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DescriptionToJson(Description instance) =>
    <String, dynamic>{
      'text': instance.text,
      'annotations': instance.annotations,
    };

Annotation _$AnnotationFromJson(Map<String, dynamic> json) => Annotation(
      bold: json['bold'] as bool,
      italic: json['italic'] as bool,
      strikethrough: json['strikethrough'] as bool,
      underline: json['underline'] as bool,
      code: json['code'] as bool,
      color: json['color'] as String,
    );

Map<String, dynamic> _$AnnotationToJson(Annotation instance) =>
    <String, dynamic>{
      'bold': instance.bold,
      'italic': instance.italic,
      'strikethrough': instance.strikethrough,
      'underline': instance.underline,
      'code': instance.code,
      'color': instance.color,
    };

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      text: json['text'] as String?,
      color: _$JsonConverterFromJson<int, Color>(
          json['color'], const ColorSerialiser().fromJson),
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'text': instance.text,
      'color': _$JsonConverterToJson<int, Color>(
          instance.color, const ColorSerialiser().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

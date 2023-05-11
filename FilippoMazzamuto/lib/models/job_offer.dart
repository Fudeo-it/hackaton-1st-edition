import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/models/color_serialiser.dart';
import 'package:offertelavoroflutter/services/network/notion/dto/page_properties.dart';
import 'package:offertelavoroflutter/ui/theme/colors.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_offer.g.dart';

class Pagination extends Equatable {
  final List<JobOffer> results;
  final String? nextCursor;
  final bool hasMore;

  const Pagination({
    required this.results,
    required this.nextCursor,
    required this.hasMore,
  });

  @override
  List<Object?> get props => [
    results,
    nextCursor,
    hasMore,
  ];
}

enum TargetJobOffer { recruitment, freelance }

/// Generic class job offer 
class JobOffer extends Equatable {
  final String id;
  final String? name;
  final String? image;
  final DateTime? posted;
  final bool archived;
  final String? candidature;
  final TargetJobOffer target;
  final String url;

  const JobOffer({
    required this.id,
    required this.name,
    required this.image,
    required this.posted,
    required this.archived,
    required this.candidature,
    required this.target,
    required this.url,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    image,
    posted,
    archived,
    candidature,
    target,
    url,
  ];

  @override
  String toString() => 
  '''
  id: $id,
  name: $name,
  image: $image,
  posted: $posted,
  archived: $archived,
  candidature: $candidature,
  target: $target,
  url: $url,
  ''';
}

/// Class recruitment jobs
@JsonSerializable()
class Recruitment extends JobOffer {
  final List<Description>? companyName;
  final String? urlWebsite;
  final List<Description>? qualification;
  final Detail? seniority;
  final Detail? team;
  final Detail? contract;
  final List<Description>? pay;
  final String? ral;
  final List<Description>? offerDescription;
  final List<Description>? locality;

  const Recruitment({
    required this.companyName,
    required this.urlWebsite,
    required this.qualification,
    required this.seniority,
    required this.team,
    required this.contract,
    required this.pay,
    required this.ral,
    required this.offerDescription,
    required this.locality,
    required super.id,
    required super.name, 
    required super.image,
    required super.posted, 
    required super.archived, 
    required super.candidature,
    required super.target,
    required super.url,
  });

  @override
  List<Object?> get props => super.props..addAll([
    companyName,
    urlWebsite,
    qualification,
    seniority,
    team,
    contract,
    pay,
    ral,
    offerDescription,
    locality,
  ]);

  factory Recruitment.fromJson(Map<String, dynamic> json) => _$RecruitmentFromJson(json);

  /// Connect the generated [_$RecruitmentToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RecruitmentToJson(this);

  @override
  String toString() => 
  '''
  ${super.toString()}
  companyName: $companyName,
  urlWebsite: $urlWebsite,
  qualification: $qualification,
  seniority: $seniority,
  team: $team,
  contract: $contract,
  pay: $pay,
  ral: $ral,
  offerDescription: $offerDescription,
  locality: $locality,
  ''';
}

/// class freelance jobs
@JsonSerializable()
class Freelance extends JobOffer {
  final List<Description>? projectDescription;
  final List<Description>? workRequest;
  final Detail? relationshipType;
  final List<Description>? timing;
  final List<Description>? budget;
  final List<Description>? paymentTimes;
  final Detail? nda;

  const Freelance({
    required super.id,
    required super.name,
    required super.image,
    required super.posted,
    required super.archived,
    required super.candidature,
    required super.target,
    required super.url,
    required this.projectDescription,
    required this.workRequest,
    required this.relationshipType,
    required this.timing,
    required this.budget,
    required this.paymentTimes,
    required this.nda
  });

  factory Freelance.fromJson(Map<String, dynamic> json) => _$FreelanceFromJson(json);

  /// Connect the generated [_$FreelanceToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$FreelanceToJson(this);

  @override
  List<Object?> get props => super.props..addAll([
    projectDescription,
    workRequest,
    relationshipType,
    timing,
    budget,
    paymentTimes,
    nda
  ]);

  @override
  String toString() => 
  '''
  ${super.toString()}
  projectDescription: $projectDescription,
  workRequest: $workRequest,
  relationshipType: $relationshipType,
  timing: $timing,
  budget: $budget,
  paymentTimes: $paymentTimes,
  nda: $nda,
  ''';
}

@JsonSerializable()
class Description extends Equatable {
  final String text;
  final Annotation annotations;

  const Description({
    required this.text,
    required this.annotations,
  });

  factory Description.toModel(BodyRichTextDTO dto) => Description(
    text: dto.plainText,
    annotations: Annotation(
      bold: dto.annotations.bold,
      italic: dto.annotations.italic,
      strikethrough: dto.annotations.strikethrough,
      underline: dto.annotations.underline,
      code: dto.annotations.code,
      color: dto.annotations.color,
    ),
  );

  factory Description.fromJson(Map<String, dynamic> json) => _$DescriptionFromJson(json);

  /// Connect the generated [_$DescriptionToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DescriptionToJson(this);

  @override
  List<Object?> get props => [text, annotations];
}

@JsonSerializable()
class Annotation extends Equatable {
  final bool bold;
  final bool italic;
  final bool strikethrough;
  final bool underline;
  final bool code;
  final String color;

  const Annotation({
    required this.bold,
    required this.italic,
    required this.strikethrough,
    required this.underline,
    required this.code,
    required this.color,
  });

  factory Annotation.fromJson(Map<String, dynamic> json) => _$AnnotationFromJson(json);

  /// Connect the generated [_$AnnotationToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AnnotationToJson(this);

  @override
  List<Object?> get props => [
    bold,
    italic,
    strikethrough,
    underline,
    code,
    color,
  ];
}

@JsonSerializable()
class Detail extends Equatable {
  final String? text;
  @ColorSerialiser()
  final Color? color;

  const Detail({
    required this.text,
    required this.color,
  });

  factory Detail.toModel(SelectDTO? dto) => Detail(
    text: dto?.selectOption?.name,
    color: dto?.selectOption?.color != null 
      ? ThemeColors.color[dto?.selectOption?.color]
      : ThemeColors.color['default'], // Default color
  );

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);

  /// Connect the generated [_$DetailToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DetailToJson(this);

  @override
  List<Object?> get props => [text, color];
}
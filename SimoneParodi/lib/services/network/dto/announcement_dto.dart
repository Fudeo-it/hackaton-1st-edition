import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter/services/network/dto/notion_type_dto.dart';

class AnnouncementDTO extends Equatable {
  final String object;
  final String id;
  final String createdTime;
  final UserDTO createdBy;
  final UserDTO lastEditedBy;
  final String lastEditedTime;
  final FileDTO? cover;
  final IconDTO icon;
  final ParentDTO parent;
  final bool archived;
  final AnnouncementPropertyDTO properties;
  final String url;

  const AnnouncementDTO({
    required this.object,
    required this.id,
    required this.createdTime,
    required this.createdBy,
    required this.lastEditedBy,
    required this.lastEditedTime,
    required this.cover,
    required this.icon,
    required this.parent,
    required this.archived,
    required this.properties,
    required this.url,
  });

  factory AnnouncementDTO.fromJson(Map<String, dynamic> data) =>
      AnnouncementDTO(
        object: data['object'],
        id: data['id'],
        createdTime: data['created_time'],
        lastEditedTime: data['last_edited_time'],
        createdBy: UserDTO.fromJson(data['created_by']),
        lastEditedBy: UserDTO.fromJson(data['last_edited_by']),
        cover: data['cover'],
        icon: IconDTO.fromJson(data['icon']),
        parent: ParentDTO.fromJson(data['parent']),
        archived: data['archived'],
        properties: AnnouncementPropertyDTO.fromJson(data['properties']),
        url: data['url'],
      );

  @override
  List<Object?> get props => [
        object,
        id,
        createdTime,
        createdBy,
        lastEditedBy,
        lastEditedTime,
        cover,
        icon,
        parent,
        archived,
        properties,
        url,
      ];
}

class AnnouncementPropertyDTO extends Equatable {
  final TimeDTO jobPosted;
  final SelectDTO team;
  final SelectDTO contract;
  final SelectDTO seniority;
  final SelectDTO ral;
  final TitleDTO name;
  final TextDTO qualification;
  final TextDTO salary;
  final TextDTO description;
  final TextDTO howToApply;
  final TextDTO location;
  final TextDTO companyName;
  final TextDTO status;
  final UrlDTO websiteUrl;

  const AnnouncementPropertyDTO({
    required this.jobPosted,
    required this.team,
    required this.contract,
    required this.seniority,
    required this.ral,
    required this.name,
    required this.qualification,
    required this.salary,
    required this.description,
    required this.howToApply,
    required this.location,
    required this.companyName,
    required this.status,
    required this.websiteUrl,
  });

  factory AnnouncementPropertyDTO.fromJson(Map<String, dynamic> data) =>
      AnnouncementPropertyDTO(
        jobPosted: TimeDTO.fromJson(data['Job Posted']),
        team: SelectDTO.fromJson(data['Team']),
        contract: SelectDTO.fromJson(data['Contratto']),
        seniority: SelectDTO.fromJson(data['Seniority']),
        ral: SelectDTO.fromJson(data['RAL']),
        name: TitleDTO.fromJson(data['Name']),
        qualification: TextDTO.fromJson(data['Qualifica']),
        salary: TextDTO.fromJson(data['Retribuzione']),
        description: TextDTO.fromJson(data['Descrizione offerta']),
        howToApply: TextDTO.fromJson(data['Come candidarsi']),
        location: TextDTO.fromJson(data['Località']),
        companyName: TextDTO.fromJson(data['Nome azienda']),
        status: TextDTO.fromJson(data['Stato di pubblicazione']),
        websiteUrl: UrlDTO.fromJson(data['URL sito web']),
      );

  @override
  List<Object?> get props => [
        jobPosted,
        team,
        contract,
        seniority,
        ral,
        name,
        qualification,
        salary,
        description,
        howToApply,
        location,
        companyName,
        status,
        websiteUrl,
      ];
}

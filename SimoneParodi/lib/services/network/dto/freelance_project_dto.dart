import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter/services/network/dto/notion_type_dto.dart';

class FreelanceProjectDTO extends Equatable {
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
  final FreelanceProjectPropertyDTO properties;
  final String url;

  const FreelanceProjectDTO({
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

  factory FreelanceProjectDTO.fromJson(Map<String, dynamic> data) =>
      FreelanceProjectDTO(
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
        properties: FreelanceProjectPropertyDTO.fromJson(data['properties']),
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

class FreelanceProjectPropertyDTO extends Equatable {
  final TextDTO timing;
  final TimeDTO jobPosted;
  final TextDTO howToApply;
  final TextDTO jobRequest;
  final TextDTO budget;
  final SelectDTO nda;
  final TitleDTO code;
  final TextDTO paymentTimes;
  final TextDTO description;
  final SelectDTO typeRelationship;

  const FreelanceProjectPropertyDTO({
    required this.timing,
    required this.jobPosted,
    required this.howToApply,
    required this.jobRequest,
    required this.budget,
    required this.nda,
    required this.code,
    required this.paymentTimes,
    required this.description,
    required this.typeRelationship,
  });

  factory FreelanceProjectPropertyDTO.fromJson(Map<String, dynamic> data) =>
      FreelanceProjectPropertyDTO(
        timing: TextDTO.fromJson(data['Tempistiche']),
        jobPosted: TimeDTO.fromJson(data['Job Posted']),
        howToApply: TextDTO.fromJson(data['Come candidarsi']),
        jobRequest: TextDTO.fromJson(data['Richiesta di lavoro']),
        budget: TextDTO.fromJson(data['Budget']),
        nda: SelectDTO.fromJson(data['NDA']),
        code: TitleDTO.fromJson(data['Codice']),
        paymentTimes: TextDTO.fromJson(data['Tempistiche di pagamento']),
        description: TextDTO.fromJson(data['Descrizione del progetto']),
        typeRelationship: SelectDTO.fromJson(data['Tipo di relazione']),
      );

  @override
  List<Object?> get props => [
        timing,
        jobPosted,
        howToApply,
        jobRequest,
        budget,
        nda,
        code,
        paymentTimes,
        description,
        typeRelationship,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:offertelavoroflutter_app/services/network/dto/generic_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/icon_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/parent_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/properties_dto.dart';
import 'package:pine/dto/dto.dart';

class JobDTO extends DTO with EquatableMixin {
  final String? object;
  final String? id;
  final String? createdTime;
  final String? lastEditedTime;
  final GenericDTO? createdBy;
  final GenericDTO? lastEditedBy;
  final GenericDTO? cover;
  final IconDTO? icon;
  final ParentDTO? parent;
  final bool? archived;
  final PropertiesDTO? properties;
  final String? url;

  JobDTO({
    required this.object,
    required this.id,
    required this.createdTime,
    required this.lastEditedTime,
    required this.createdBy,
    required this.lastEditedBy,
    required this.cover,
    required this.icon,
    required this.parent,
    required this.properties,
    required this.archived,
    required this.url,
  });

  factory JobDTO.fromJson(Map<String, dynamic> json) => JobDTO(
        object: json[K.objectKey],
        id: json[K.idKey],
        createdTime: json[K.createdTimeKey],
        lastEditedTime: json[K.lastEditedTimeKey],
        createdBy: json[K.createdByKey] == null
            ? null
            : GenericDTO.fromJson(json[K.createdByKey]),
        lastEditedBy: json[K.lastEditedByKey] == null
            ? null
            : GenericDTO.fromJson(json[K.lastEditedByKey]),
        cover: json[K.coverKey] == null
            ? null
            : GenericDTO.fromJson(json[K.coverKey]),
        icon:
            json[K.iconKey] == null ? null : IconDTO.fromJson(json[K.iconKey]),
        parent: json[K.parentKey] == null
            ? null
            : ParentDTO.fromJson(json[K.parentKey]),
        properties: json[K.propertiesKey] == null
            ? null
            : PropertiesDTO.fromJson(json[K.propertiesKey]),
        archived: json[K.archivedKey],
        url: json[K.urlKey],
      );

  @override
  List<Object?> get props => [
        object,
        id,
        createdTime,
        lastEditedTime,
        createdBy,
        lastEditedBy,
        icon,
        parent,
        properties,
        archived,
        url,
      ];
}

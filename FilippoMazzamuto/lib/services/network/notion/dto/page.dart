// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:offertelavoroflutter/services/network/notion/dto/page_properties.dart';

class PageDTO extends Equatable {
  final String object;
  final String id;
  final DateTime createdTime;
  final DateTime lastEditedTime;
  final CreatedByDTO createdBy;
  final LastEditedByDTO lastEditedBy;
  final CoverDTO? cover;
  final IconDTO? icon;
  final ParentDTO parent;
  final bool archived;
  final PropertiesDTO properties;
  final String url;

  const PageDTO({
    required this.object,
    required this.id,
    required this.createdTime,
    required this.lastEditedTime,
    required this.createdBy,
    required this.lastEditedBy,
    required this.cover,
    required this.icon,
    required this.parent,
    required this.archived,
    required this.properties,
    required this.url,
  });

  factory PageDTO.fromJson(Map<String, dynamic> data) => PageDTO(
    object: data['object'],
    id: data['id'],
    createdTime: DateFormat('yyyy-MM-dd').parse(data['created_time']),
    lastEditedTime: DateFormat('yyyy-MM-dd').parse(data['last_edited_time']),
    createdBy: CreatedByDTO.fromJson(data['created_by']),
    lastEditedBy: LastEditedByDTO.fromJson(data['last_edited_by']),
    cover: data['cover'] != null ? CoverDTO.fromJson(data['cover']) : null,
    icon: IconDTO.fromJson(data['icon']),
    parent: ParentDTO.fromJson(data['parent']),
    archived: data['archived'],
    properties: PropertiesDTO.fromJson(data['properties']),
    url: data['url'],
  );

  @override
  List<Object?> get props => [
    object,
    id,
    createdTime,
    lastEditedTime,
    createdBy,
    lastEditedBy,
    cover,
    icon,
    parent,
    archived,
    properties,
    url,
  ];

}

class CreatedByDTO extends Equatable {
  final String object;
  final String id;

  const CreatedByDTO({
    required this.object,
    required this.id,
  });

  factory CreatedByDTO.fromJson(Map<String, dynamic> data) =>
    CreatedByDTO(
      object: data['object'],
      id: data['id'],
    );

  @override
  List<Object?> get props => [
    object,
    id,
  ];
}

class LastEditedByDTO extends Equatable {
  final String object;
  final String id;

  const LastEditedByDTO({
    required this.object,
    required this.id,
  });

  factory LastEditedByDTO.fromJson(Map<String, dynamic> data) =>
    LastEditedByDTO(
      object: data['object'],
      id: data['id'],
    );

  @override
  List<Object?> get props => [object, id];
}

class CoverDTO extends Equatable {
  final String type;
  final ExternalDTO external;

  const CoverDTO({
    required this.type,
    required this.external,
  });

  factory CoverDTO.fromJson(Map<String, dynamic> data) =>
    CoverDTO(
      type: data['type'],
      external: ExternalDTO.fromJson(data['external']),
    );

  @override
  List<Object?> get props => [type, external];
}

class ExternalDTO extends Equatable {
  final String url;

  const ExternalDTO({
    required this.url
  });

  factory ExternalDTO.fromJson(Map<String, dynamic> data) => 
    ExternalDTO(
      url: data['url'],
    );

  @override
  List<Object?> get props => [url];
}

class IconDTO extends Equatable {
  final String type;
  final String emoji;

  const IconDTO({
    required this.type,
    required this.emoji,
  });

  factory IconDTO.fromJson(Map<String, dynamic> data) => 
    IconDTO(
      type: data['type'],
      emoji: data['emoji'],
    );

  @override
  List<Object?> get props => [type, emoji];
}

class ParentDTO extends Equatable {
  final String type;
  final String databaseId;

  const ParentDTO({
    required this.type,
    required this.databaseId,
  });

  factory ParentDTO.fromJson(Map<String, dynamic> data) => ParentDTO(
    type: data['type'],
    databaseId: data['database_id'],
  );

  @override
  List<Object?> get props => [type, databaseId];
}

class PropertiesDTO extends Equatable {
  final Map<String, PagePropertiesDTO?> property;

  const PropertiesDTO({
    required this.property,
  });

  factory PropertiesDTO.fromJson(Map<String, dynamic> data) {
    final Map<String, PagePropertiesDTO?> tmpProperty = {};
    data.forEach((key, value) {
      final PropertyTypes type = PropertyTypes.values.byName(value['type']);
      switch(type) {
        case PropertyTypes.created_time:
          tmpProperty[key] = CreatedTimeDTO.fromJson({'field': key, ...value});
          break;
        case PropertyTypes.select:
          tmpProperty[key] = SelectDTO.fromJson({'field': key, ...value});
          break;
        case PropertyTypes.title:
          tmpProperty[key] = TitleDTO.fromJson({'field': key, ...value});
          break;
        case PropertyTypes.rich_text:
          tmpProperty[key] = RichTextDTO.fromJson({'field': key, ...value});
          break;
        case PropertyTypes.url:
          tmpProperty[key] = UrlDTO.fromJson({'field': key, ...value});
          break;
        default:
          tmpProperty[key] = null;
          break;
      }
    });

    return PropertiesDTO(property: tmpProperty);
  }

  @override
  List<Object?> get props => [property];
}

/// the various types of page properties
enum PropertyTypes {
  checkbox,
  created_by,
  created_time,
  date,
  email,
  files,
  formula,
  last_edited_by,
  last_edited_time,
  multi_select,
  number,
  people,
  phone_number,
  relation,
  rollup,
  rich_text,
  select,
  status,
  title,
  url,
}
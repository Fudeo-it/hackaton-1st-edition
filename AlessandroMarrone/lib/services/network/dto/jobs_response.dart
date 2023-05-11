import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

part 'type_props_classes.dart';

class JobsResponse extends DTO with EquatableMixin {
  final String object;
  final String id;
  final String createdTime; //DateTime
  final String lastEditedTime; //DateTime
  final PropType createdBy;
  final PropType lastEditedBy;
  final bool archived;
  final String url;
  final List<PropertyItemDTO> properties;

  JobsResponse({
    required this.object,
    required this.id,
    required this.createdTime,
    required this.lastEditedTime,
    required this.createdBy,
    required this.lastEditedBy,
    required this.archived,
    required this.url,
    required this.properties,
  });

  factory JobsResponse.fromJson(Map<String, dynamic> data) {
    List<PropertyItemDTO> items = [];
    (data["properties"] as Map<String, dynamic>).forEach(
      (key, value) => items.add(
        PropertyItemDTO.fromJson(key, value),
      ),
    );

    return JobsResponse(
      object: data["object"],
      id: data["id"],
      createdTime: data["created_time"],
      lastEditedTime: data["last_edited_time"],
      createdBy: PropType(CreatedByTypeProp.fromJson(data)),
      lastEditedBy: PropType(LastEditedByTypeProp.fromJson(data)),
      archived: data["archived"],
      url: data["url"],
      properties: items,
    );
  }

  @override
  List<Object?> get props => [
        object,
        id,
        createdTime,
        lastEditedTime,
        createdBy,
        lastEditedBy,
        archived,
        properties,
        url,
      ];
}

class PropertyItemDTO extends Equatable {
  final String nameField;
  final String typeField;
  final PropType? valueField;

  const PropertyItemDTO({
    required this.nameField,
    required this.typeField,
    this.valueField,
  });

  factory PropertyItemDTO.fromJson(String key, Map<String, dynamic> data) =>
      PropertyItemDTO(
        nameField: key,
        typeField: data["type"],
        valueField: _getValue(data),
      );

  @override
  List<Object?> get props => [nameField, valueField];
}

PropType? _getValue(Map<String, dynamic> data) {
  final type = data["type"];

  switch (type) {
    case "checkbox":
      return PropType<ChechBoxTypeProp>(ChechBoxTypeProp.fromJson(data));

    case "created_by":
      return PropType<CreatedByTypeProp>(CreatedByTypeProp.fromJson(data));

    case "created_time":
      return PropType<CreatedTimeTypeProp>(CreatedTimeTypeProp.fromJson(data));

    case "date":
      return PropType<DateTypeProp>(DateTypeProp.fromJson(data[type]));

    case "email":
      return PropType<EmailTypeProp>(EmailTypeProp.fromJson(data));

    case "files":
      List<FilesTypeProp> files = [];

      files = (data[type] as List)
          .map(
            (item) => FilesTypeProp.fromJson(item),
          )
          .toList(growable: false);

      return PropType(files);

    // TODO: altri case nel mezzo

    case "rich_text":
      List<RichTextTypeProp> richTexts;

      richTexts = (data[type] as List)
          .map(
            (item) => RichTextTypeProp.fromJson(item),
          )
          .toList(growable: false);

      return PropType<List<RichTextTypeProp>>(richTexts);

    case "select":
      return PropType<SelectTypeProp>(
          data[type] != null ? SelectTypeProp.fromJson(data[type]) : null);

    case "title":
      List<TitleTypeProp> titles = [];

      titles = (data[type] as List)
          .map(
            (item) => TitleTypeProp.fromJson(item),
          )
          .toList(growable: false);

      return PropType<List<TitleTypeProp>>(titles);

    default:
      return null;
  }
}

class PropType<T> extends Equatable {
  final T? values;

  const PropType(this.values);

  @override
  List<Object?> get props => [values];
}

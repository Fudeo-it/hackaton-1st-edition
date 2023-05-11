import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:offertelavoroflutter_app/services/network/dto/property_dto.dart';
import 'package:pine/dto/dto.dart';

class SelectDTO extends PropertyDTO with EquatableMixin {
  final SelectContentDTO? select;

  SelectDTO({
    required super.id,
    required super.type,
    required this.select,
  });

  factory SelectDTO.fromJson(Map<String, dynamic> json) => SelectDTO(
        id: json[K.idKey],
        type: json[K.typeKey],
        select: json[K.selectKey] == null
            ? null
            : SelectContentDTO.fromJson(json[K.selectKey]),
      );

  @override
  List<Object?> get props => [
        id,
        type,
        select,
      ];
}

class SelectContentDTO extends DTO with EquatableMixin {
  final String? id;
  final String? name;
  final String? color;

  SelectContentDTO({
    required this.id,
    required this.name,
    required this.color,
  });

  factory SelectContentDTO.fromJson(Map<String, dynamic> json) =>
      SelectContentDTO(
        id: json[K.idKey],
        name: json[K.nameKey],
        color: json[K.colorKey],
      );

  @override
  List<Object?> get props => [
        id,
        name,
        color,
      ];
}

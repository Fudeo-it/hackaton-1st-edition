import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:pine/dto/dto.dart';

class GenericDTO extends DTO with EquatableMixin {
  final String? object;
  final String? id;

  GenericDTO({
    required this.object,
    required this.id,
  });

  factory GenericDTO.fromJson(Map<String, dynamic> json) => GenericDTO(
        object: json[K.objectKey],
        id: json[K.idKey],
      );

  Map<String, dynamic> toJson() => {
        K.objectKey: object,
        K.idKey: id,
      };

  @override
  List<Object?> get props => [
        object,
        id,
      ];
}

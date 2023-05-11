import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:offertelavoroflutter_app/services/network/dto/property_dto.dart';

class CreatedTimeDTO extends PropertyDTO with EquatableMixin {
  final String createdTime;

  CreatedTimeDTO({
    required super.id,
    required super.type,
    required this.createdTime,
  });

  factory CreatedTimeDTO.fromJson(Map<String, dynamic> json) => CreatedTimeDTO(
        id: json[K.idKey],
        type: json[K.typeKey],
        createdTime: json[K.createdTimeKey],
      );

  @override
  List<Object?> get props => [
        id,
        type,
        createdTime,
      ];
}

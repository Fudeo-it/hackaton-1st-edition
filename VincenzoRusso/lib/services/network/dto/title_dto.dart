import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:offertelavoroflutter_app/services/network/dto/property_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/text_dto.dart';

class TitleDTO extends PropertyDTO with EquatableMixin {
  final List<TextDTO> title;

  TitleDTO({
    required super.id,
    required super.type,
    required this.title,
  });

  factory TitleDTO.fromJson(Map<String, dynamic> json) => TitleDTO(
        id: json[K.idKey],
        type: json[K.typeKey],
        title: json[K.titleKey]
            .map<TextDTO>((item) => TextDTO.fromJson(item))
            .toList(growable: false),
      );

  @override
  List<Object?> get props => [
        id,
        type,
        title,
      ];
}

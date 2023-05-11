import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:offertelavoroflutter_app/services/network/dto/property_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/text_dto.dart';

class RichTextDTO extends PropertyDTO with EquatableMixin {
  final List<TextDTO> richText;

  RichTextDTO({
    required super.id,
    required super.type,
    required this.richText,
  });

  factory RichTextDTO.fromJson(Map<String, dynamic> json) => RichTextDTO(
        id: json[K.idKey],
        type: json[K.typeKey],
        richText: json[K.richTextKey]
            .map<TextDTO>((item) => TextDTO.fromJson(item))
            .toList(growable: false),
      );

  @override
  List<Object?> get props => [
        id,
        type,
        richText,
      ];
}

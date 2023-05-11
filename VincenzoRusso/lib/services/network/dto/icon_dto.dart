import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:pine/dto/dto.dart';

class IconDTO extends DTO with EquatableMixin {
  final String type;
  final String emoji;

  IconDTO({
    required this.type,
    required this.emoji,
  });

  factory IconDTO.fromJson(Map<String, dynamic> json) => IconDTO(
        type: json[K.typeKey],
        emoji: json[K.emojiKey],
      );

  Map<String, dynamic> toJson() => {
        K.typeKey: type,
        K.emojiKey: emoji,
      };

  @override
  List<Object?> get props => [
        type,
        emoji,
      ];
}

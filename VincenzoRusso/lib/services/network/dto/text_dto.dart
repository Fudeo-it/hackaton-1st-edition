import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:pine/dto/dto.dart';

class TextDTO extends DTO with EquatableMixin {
  final String? type;
  final TextContentDTO? text;
  final AnnotationsDTO? annotations;
  final String? plainText;
  final String? href;

  TextDTO({
    required this.type,
    required this.text,
    required this.annotations,
    required this.plainText,
    required this.href,
  });

  factory TextDTO.fromJson(Map<String, dynamic> json) => TextDTO(
        type: json[K.typeKey],
        text: json[K.textKey] == null
            ? null
            : TextContentDTO.fromJson(json[K.textKey]),
        annotations: json[K.annotationsKey] == null
            ? null
            : AnnotationsDTO.fromJson(json[K.annotationsKey]),
        plainText: json[K.plainTextKey],
        href: json[K.hrefKey],
      );

  @override
  List<Object?> get props => [
        type,
        text,
        annotations,
        plainText,
        href,
      ];
}

class TextContentDTO extends DTO with EquatableMixin {
  final String? content;
  final String? link;

  TextContentDTO({
    required this.content,
    required this.link,
  });

  factory TextContentDTO.fromJson(Map<String, dynamic> json) => TextContentDTO(
        content: json[K.contentKey],
        link: json[K.linkKey] == null ? null : json[K.linkKey][K.urlKey],
      );

  Map<String, dynamic> toJson() => {
        K.contentKey: content,
        K.linkKey: {
          K.urlKey: link,
        }
      };

  @override
  List<Object?> get props => [
        content,
        link,
      ];
}

class AnnotationsDTO extends DTO with EquatableMixin {
  final bool bold;
  final bool italic;
  final bool strikethrough;
  final bool underline;
  final bool code;
  final String? color;

  AnnotationsDTO({
    required this.bold,
    required this.italic,
    required this.strikethrough,
    required this.underline,
    required this.code,
    required this.color,
  });

  factory AnnotationsDTO.fromJson(Map<String, dynamic> json) => AnnotationsDTO(
        bold: json[K.boldKey],
        italic: json[K.italicKey],
        strikethrough: json[K.strikethroughKey],
        underline: json[K.undelineKey],
        code: json[K.codeKey],
        color: json[K.colorKey],
      );

  Map<String, dynamic> toJson() => {
        K.boldKey: bold,
        K.italicKey: italic,
        K.strikethroughKey: strikethrough,
        K.undelineKey: underline,
        K.codeKey: code,
        K.colorKey: color,
      };

  @override
  List<Object?> get props => [
        bold,
        italic,
        strikethrough,
        underline,
        code,
        color,
      ];
}

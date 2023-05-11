import 'package:equatable/equatable.dart';

class TimeDTO extends Equatable {
  final String id;
  final String type;
  final String createdTime;

  const TimeDTO({
    required this.id,
    required this.type,
    required this.createdTime,
  });

  factory TimeDTO.fromJson(Map<String, dynamic> data) => TimeDTO(
        id: data['id'],
        type: data['type'],
        createdTime: data['created_time'],
      );

  @override
  List<Object?> get props => [
        id,
        type,
        createdTime,
      ];
}

class SelectDTO extends Equatable {
  final String id;
  final String type;
  final SelectedValueDTO? select;

  const SelectDTO({
    required this.id,
    required this.type,
    required this.select,
  });

  factory SelectDTO.fromJson(Map<String, dynamic> data) => SelectDTO(
        id: data['id'],
        type: data['type'],
        select: data['select'] == null
            ? data['select']
            : SelectedValueDTO.fromJson(data['select']),
      );

  @override
  List<Object?> get props => [
        id,
        type,
        select,
      ];
}

class SelectedValueDTO extends Equatable {
  final String id;
  final String name;
  final String color;

  const SelectedValueDTO({
    required this.id,
    required this.name,
    required this.color,
  });

  factory SelectedValueDTO.fromJson(Map<String, dynamic> data) =>
      SelectedValueDTO(
        id: data['id'],
        name: data['name'],
        color: data['color'],
      );

  @override
  List<Object?> get props => [
        id,
        name,
        color,
      ];
}

class TitleDTO extends Equatable {
  final String id;
  final String type;
  final List<RichTextDTO> title;

  const TitleDTO({
    required this.id,
    required this.type,
    required this.title,
  });

  factory TitleDTO.fromJson(Map<String, dynamic> data) => TitleDTO(
        id: data['id'],
        type: data['type'],
        title: (data['title'] as List)
            .map(
              (richText) =>
                  RichTextDTO.fromJson(richText as Map<String, dynamic>),
            )
            .toList(growable: false),
      );

  @override
  List<Object?> get props => [
        id,
        type,
        title,
      ];
}

class FileDTO extends Equatable {
  final String type;
  final String url;
  final String? expiryTime;

  const FileDTO({
    required this.type,
    required this.url,
    required this.expiryTime,
  });

  factory FileDTO.fromJson(Map<String, dynamic> data) {
    if (data['file'] == null) {
      return FileDTO(
        type: data['type'],
        url: data['external']['url'],
        expiryTime: null,
      );
    }
    return FileDTO(
      type: data['type'],
      url: data['file']['url'],
      expiryTime: data['file']['expiry_time'],
    );
  }

  @override
  List<Object?> get props => [
        type,
        url,
        expiryTime,
      ];
}

class TextDTO extends Equatable {
  final String id;
  final String type;
  final List<RichTextDTO> richText;

  const TextDTO({
    required this.id,
    required this.type,
    required this.richText,
  });

  factory TextDTO.fromJson(Map<String, dynamic> data) => TextDTO(
        id: data['id'],
        type: data['type'],
        richText: (data['rich_text'] as List)
            .map(
              (richText) =>
                  RichTextDTO.fromJson(richText as Map<String, dynamic>),
            )
            .toList(growable: false),
      );

  @override
  List<Object?> get props => [
        id,
        type,
        richText,
      ];

  String get allText => richText
      .fold(
        '',
        (previousValue, element) => '$previousValue ${element.text.content}',
      )
      .trim();
}

class UrlDTO extends Equatable {
  final String id;
  final String type;
  final String? url;

  const UrlDTO({
    required this.id,
    required this.type,
    required this.url,
  });

  factory UrlDTO.fromJson(Map<String, dynamic> data) => UrlDTO(
        id: data['id'],
        type: data['type'],
        url: data['url'],
      );

  @override
  List<Object?> get props => [
        id,
        type,
        url,
      ];
}

class RichTextDTO extends Equatable {
  final String type;
  final RichTextContentDTO text;
  final AnnotationDTO annotations;
  final String plainText;
  final String? href;

  const RichTextDTO({
    required this.type,
    required this.text,
    required this.annotations,
    required this.plainText,
    required this.href,
  });

  factory RichTextDTO.fromJson(Map<String, dynamic> data) => RichTextDTO(
        type: data['type'],
        text: RichTextContentDTO.fromJson(data['text']),
        annotations: AnnotationDTO.fromJson(data['annotations']),
        plainText: data['plain_text'],
        href: data['href'],
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

class RichTextContentDTO extends Equatable {
  final String content;
  final String? link;

  const RichTextContentDTO({
    required this.content,
    required this.link,
  });

  factory RichTextContentDTO.fromJson(Map<String, dynamic> data) =>
      RichTextContentDTO(
        content: data['content'],
        link: data['link'] == null ? null : data['link']['url'],
      );

  @override
  List<Object?> get props => [
        content,
        link,
      ];
}

class AnnotationDTO extends Equatable {
  final bool bold;
  final bool italic;
  final bool strikethrough;
  final bool underline;
  final bool code;
  final String color;

  const AnnotationDTO({
    required this.bold,
    required this.italic,
    required this.strikethrough,
    required this.underline,
    required this.code,
    required this.color,
  });

  factory AnnotationDTO.fromJson(Map<String, dynamic> data) => AnnotationDTO(
        bold: data['bold'],
        italic: data['italic'],
        strikethrough: data['strikethrough'],
        underline: data['underline'],
        code: data['code'],
        color: data['color'],
      );

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
  List<Object?> get props => [
        type,
        databaseId,
      ];
}

class IconDTO extends Equatable {
  final String type;
  final String emoji;

  const IconDTO({
    required this.type,
    required this.emoji,
  });

  factory IconDTO.fromJson(Map<String, dynamic> data) => IconDTO(
        type: data['type'],
        emoji: data['emoji'],
      );

  @override
  List<Object?> get props => [
        type,
        emoji,
      ];
}

class UserDTO extends Equatable {
  final String object;
  final String id;

  const UserDTO({
    required this.object,
    required this.id,
  });

  factory UserDTO.fromJson(Map<String, dynamic> data) => UserDTO(
        object: data['object'],
        id: data['id'],
      );

  @override
  List<Object?> get props => [
        object,
        id,
      ];
}

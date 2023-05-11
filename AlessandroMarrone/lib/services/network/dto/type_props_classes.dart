part of 'jobs_response.dart';

class AnnotationsTypeProp extends Equatable {
  final bool bold;
  final bool italic;
  final bool strikethrough;
  final bool underline;
  final bool code;
  final String color;

  const AnnotationsTypeProp({
    required this.bold,
    required this.italic,
    required this.strikethrough,
    required this.underline,
    required this.code,
    required this.color,
  });

  factory AnnotationsTypeProp.fromJson(Map<String, dynamic> data) =>
      AnnotationsTypeProp(
        bold: data["bold"],
        italic: data["italic"],
        strikethrough: data["strikethrough"],
        underline: data["underline"],
        code: data["code"],
        color: data["color"],
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

class ChechBoxTypeProp extends Equatable {
  final bool checkbox;

  const ChechBoxTypeProp({
    required this.checkbox,
  });

  factory ChechBoxTypeProp.fromJson(Map<String, dynamic> data) =>
      ChechBoxTypeProp(checkbox: data["checkbox"]);

  @override
  List<Object?> get props => [checkbox];
}

class CreatedByTypeProp extends Equatable {
  final UserObject object;

  const CreatedByTypeProp({
    required this.object,
  });

  factory CreatedByTypeProp.fromJson(Map<String, dynamic> data) =>
      CreatedByTypeProp(object: UserObject.fromJson(data["created_by"]));

  @override
  List<Object?> get props => [object];
}

class CreatedTimeTypeProp extends Equatable {
  final String createdTime;

  const CreatedTimeTypeProp({
    required this.createdTime,
  });

  factory CreatedTimeTypeProp.fromJson(Map<String, dynamic> data) =>
      CreatedTimeTypeProp(createdTime: data["created_time"]);

  @override
  List<Object?> get props => [createdTime];
}

class DateTypeProp extends Equatable {
  final String start;
  final String end;

  const DateTypeProp({
    required this.start,
    required this.end,
  });

  factory DateTypeProp.fromJson(Map<String, dynamic> data) =>
      DateTypeProp(start: data["start"], end: data["end"] ?? "");

  @override
  List<Object?> get props => [start, end];
}

class EmailTypeProp extends Equatable {
  final String email;

  const EmailTypeProp({
    required this.email,
  });

  factory EmailTypeProp.fromJson(Map<String, dynamic> data) =>
      EmailTypeProp(email: data["email"]);

  @override
  List<Object?> get props => [email];
}

class FilesTypeProp extends Equatable {
  final String name;
  final String url;

  const FilesTypeProp({
    required this.name,
    required this.url,
  });

  factory FilesTypeProp.fromJson(Map<String, dynamic> data) =>
      FilesTypeProp(name: data["name"], url: data[data["type"]]["url"]);

  @override
  List<Object?> get props => [name, url];
}

class FormulaTypeProp extends Equatable {
  final String type;
  final dynamic value;

  const FormulaTypeProp({
    required this.type,
    required this.value,
  });

  @override
  List<Object?> get props => [type, value];
}

class LastEditedByTypeProp extends Equatable {
  final UserObject object;

  const LastEditedByTypeProp({
    required this.object,
  });

  factory LastEditedByTypeProp.fromJson(Map<String, dynamic> data) =>
      LastEditedByTypeProp(object: UserObject.fromJson(data["last_edited_by"]));

  @override
  List<Object?> get props => [object];
}

class LastEditedTimeTypeProp extends Equatable {
  final String type;
  final String lastEditedTime;

  const LastEditedTimeTypeProp({
    required this.type,
    required this.lastEditedTime,
  });

  @override
  List<Object?> get props => [];
}

class LinkTypeProp extends Equatable {
  final String url;

  const LinkTypeProp({
    required this.url,
  });

  factory LinkTypeProp.fromJson(Map<String, dynamic> data) =>
      LinkTypeProp(url: data["url"]);

  @override
  List<Object?> get props => [url];
}

class MultiSelectTypeProp extends Equatable {
  final String id;
  final String name;
  final String color;

  const MultiSelectTypeProp({
    required this.id,
    required this.name,
    required this.color,
  });

  @override
  List<Object?> get props => [id, name, color];
}

class NumberTypeProp extends Equatable {
  final int number;

  const NumberTypeProp({
    required this.number,
  });
  @override
  List<Object?> get props => [number];
}

class PeopleTypeProp extends Equatable {
  final UserObject object;

  const PeopleTypeProp({
    required this.object,
  });

  @override
  List<Object?> get props => [object];
}

class PhoneNumberTypeProp extends Equatable {
  final String phoneNumber;

  const PhoneNumberTypeProp({
    required this.phoneNumber,
  });
  @override
  List<Object?> get props => [phoneNumber];
}

class RelationTypeProp extends Equatable {
  final String id;
  final bool hasMore;

  const RelationTypeProp({
    required this.id,
    required this.hasMore,
  });

  @override
  List<Object?> get props => [id];
}

class RollupTypeProp extends Equatable {
  final String rollupPropertyName;
  final String relationPropertyName;
  final String rollupPropertyId;
  final String relationPropertyId;
  final String function;

  const RollupTypeProp({
    required this.rollupPropertyName,
    required this.relationPropertyName,
    required this.rollupPropertyId,
    required this.relationPropertyId,
    required this.function,
  });

  @override
  List<Object?> get props => [
        rollupPropertyName,
        relationPropertyName,
        rollupPropertyId,
        relationPropertyId,
        function,
      ];
}

class RichTextTypeProp extends Equatable {
  final TextTypeProp text;
  final AnnotationsTypeProp annotations;
  final String plainText;
  final String? href;

  const RichTextTypeProp({
    required this.text,
    required this.annotations,
    required this.plainText,
    this.href,
  });

  factory RichTextTypeProp.fromJson(Map<String, dynamic> data) =>
      RichTextTypeProp(
        text: TextTypeProp.fromJson(data["text"]),
        annotations: AnnotationsTypeProp.fromJson(data["annotations"]),
        plainText: data["plain_text"],
        href: data["href"],
      );

  @override
  List<Object?> get props => [text, annotations, plainText, href];
}

class SelectTypeProp extends Equatable {
  final String id;
  final String name;
  final String color;

  const SelectTypeProp({
    required this.id,
    required this.name,
    required this.color,
  });

  factory SelectTypeProp.fromJson(Map<String, dynamic> data) =>
      SelectTypeProp(id: data["id"], name: data["name"], color: data["color"]);

  @override
  List<Object?> get props => [id, name, color];
}

class StatusTypeProp extends Equatable {
  final String id;
  final String name;
  final String color;

  const StatusTypeProp({
    required this.id,
    required this.name,
    required this.color,
  });

  @override
  List<Object?> get props => [id, name, color];
}

class TextTypeProp extends Equatable {
  final String content;
  final LinkTypeProp? link;

  const TextTypeProp({
    required this.content,
    this.link,
  });

  factory TextTypeProp.fromJson(Map<String, dynamic> data) => TextTypeProp(
        content: data["content"],
        link: data["link"] != null ? LinkTypeProp.fromJson(data["link"]) : null,
      );

  @override
  List<Object?> get props => [content, link];
}

class TitleTypeProp extends RichTextTypeProp with EquatableMixin {
  TitleTypeProp(
      {required super.text,
      required super.annotations,
      required super.plainText,
      super.href});

  factory TitleTypeProp.fromJson(Map<String, dynamic> data) => TitleTypeProp(
        text: TextTypeProp.fromJson(data["text"]),
        annotations: AnnotationsTypeProp.fromJson(data["annotations"]),
        plainText: data["plain_text"],
        href: data["href"],
      );

  @override
  List<Object?> get props => [...super.props];
}

class UrlTypeProp extends Equatable {
  final String url;

  const UrlTypeProp({
    required this.url,
  });

  @override
  List<Object?> get props => [url];
}

class UserObject extends Equatable {
  final String object;
  final String id;
  final String? name;
  final String? avatarUrl;
  final String? type;

  const UserObject({
    required this.object,
    required this.id,
    this.name,
    this.avatarUrl,
    this.type,
  });

  factory UserObject.fromJson(Map<String, dynamic> data) => UserObject(
      object: data["object"],
      id: data["id"],
      name: data["name"],
      avatarUrl: data["avatar_url"],
      type: data["type"]);

  @override
  List<Object?> get props => [];
}

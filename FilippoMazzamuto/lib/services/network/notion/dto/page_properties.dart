import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

abstract class PagePropertiesDTO extends Equatable {
  const PagePropertiesDTO();

  final String field = '';

  @override
  List<Object?> get props => [];
}

class CreatedTimeDTO extends Equatable implements PagePropertiesDTO {
  final String field;
  final String id;
  final String type;
  final DateTime createdTime;

  const CreatedTimeDTO({
    required this.field,
    required this.id,
    required this.type,
    required this.createdTime,
  });

  factory CreatedTimeDTO.fromJson(Map<String, dynamic> data) => CreatedTimeDTO(
    field: data['field'],
    id: data['id'],
    type: data['type'],
    createdTime: DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(data['created_time']),
  );

  @override
  List<Object?> get props => [
    field,
    id,
    type,
    createdTime,
  ];
}

class SelectDTO extends PagePropertiesDTO {
  final String field;
  final String id;
  final String type;
  final SelectOptionDTO? selectOption;

  const SelectDTO({
    required this.field,
    required this.id,
    required this.type,
    required this.selectOption,
  });

  factory SelectDTO.fromJson(Map<String, dynamic> data) => SelectDTO(
    field: data['field'],
    id: data['id'],
    type: data['type'],
    selectOption: data['select'] != null 
      ? SelectOptionDTO(
          id: data['select']?['id'], 
          name: data['select']?['name'], 
          color: data['select']?['color']
        )
      : null,
  );

  @override
  List<Object?> get props => [
    field,
    id,
    type,
    selectOption,
  ];
}

class SelectOptionDTO {
  final String id;
  final String name;
  final String color;

  const SelectOptionDTO({
    required this.id,
    required this.name,
    required this.color,
  });
}

class TitleDTO extends PagePropertiesDTO {
  final String field;
  final String id;
  final String type;
  final List<BodyRichTextDTO> title;

  const TitleDTO({
    required this.field,
    required this.id,
    required this.type,
    required this.title,
  });

  factory TitleDTO.fromJson(Map<String, dynamic> data) => TitleDTO(
    field: data['field'],
    id: data['id'],
    type: data['type'],
    title: (data['title'] as List)
      .map((item) => BodyRichTextDTO.fromJson(item))
      .toList(growable: false),
  );

  @override
  List<Object?> get props => [
    field,
    id,
    type,
    title
  ];
}

class RichTextDTO extends PagePropertiesDTO {
  final String field;
  final String id;
  final String type;
  final List<BodyRichTextDTO> richText;

  const RichTextDTO({
    required this.field,
    required this.id,
    required this.type,
    required this.richText,
  });

  factory RichTextDTO.fromJson(Map<String, dynamic> data) => RichTextDTO(
    field: data['field'],
    id: data['id'],
    type: data['type'],
    richText: (data['rich_text'] as List)
      .map((item) => BodyRichTextDTO.fromJson(item))
      .toList(growable: false),
  );

  @override
  List<Object?> get props => [
    field,
    id,
    type,
    richText
  ];
}


// URL
/// https://developers.notion.com/reference/page-property-values#url
class UrlDTO extends PagePropertiesDTO {
  final String field;
  final String id;
  final String type;
  final String? url;

  const UrlDTO({
    required this.field,
    required this.id,
    required this.type,
    required this.url,
  });

  factory UrlDTO.fromJson(Map<String, dynamic> data) => UrlDTO(
    field: data['field'],
    id: data['id'],
    type: data['type'],
    url: data['url'],
  );

  @override
  List<Object?> get props => [
    field,
    id,
    type,
    url,
  ];
}

// ignore_for_file: constant_identifier_names

/// Body Rich Text Object
/// https://developers.notion.com/reference/rich-text
class BodyRichTextDTO extends PagePropertiesDTO {
  final RichTextType type;
  final RichTextConfigDTO? config; // represents the name of the type
  final AnnotationsDTO annotations;
  final String plainText;
  final String? href;

  const BodyRichTextDTO({
    required this.type,
    required this.config,
    required this.annotations,
    required this.plainText,
    required this.href,
  });

  factory BodyRichTextDTO.fromJson(Map<String, dynamic> data) {
    final RichTextType type = RichTextType.values.byName(data['type'] as String);
    RichTextConfigDTO? config;

    switch(type) {
      case RichTextType.text:
        config = TextConfigDTO.fromJson(data['text']);
        break;
      case RichTextType.equation:
        config = EquationConfigDTO.fromJson(data['equation']);
        break;
      case RichTextType.mention:
        config = MentionConfigDTO.fromJson(data['mention']);
        break;
      default:
        throw Exception('Invalid type: $type');
    }

    return BodyRichTextDTO(
      type: type,
      config: config,
      annotations: AnnotationsDTO.fromJson(data['annotations']),
      plainText: data['plain_text'],
      href: data['href'],
    );
  }

  @override
  List<Object?> get props => [
    type,
    config,
    annotations,
    plainText,
    href,
  ];

  @override
  String toString() => '''
  type: $type,
  ''';
}

enum RichTextType {
  text,
  mention,
  equation,
}


/// Rich Text Config Abstract
/// https://developers.notion.com/reference/rich-text#rich-text-type-objects
abstract class RichTextConfigDTO extends Equatable {
  const RichTextConfigDTO();

  @override
  List<Object?> get props => [];
}

/// Text
/// If a rich text object’s type value is "text", 
/// then the corresponding text field contains an object including the following:
/// https://developers.notion.com/reference/rich-text#text
class TextConfigDTO extends RichTextConfigDTO {
  final String content;
  final LinkObjectDTO? link;

  const TextConfigDTO({
    required this.content,
    required this.link,
  });

  factory TextConfigDTO.fromJson(Map<String, dynamic> data) => TextConfigDTO(
    content: data['content'] as String,
    link: (data['link'] != null) ? LinkObjectDTO.fromJson(data['link']) : null,
  );

  @override
  List<Object?> get props => [
    content,
    link,
  ];
}

class LinkObjectDTO {
  final String url;

  const LinkObjectDTO({
    required this.url,
  });

  factory LinkObjectDTO.fromJson(Map<String, dynamic> data) => LinkObjectDTO(
    url: data['url'] as String
  );
}


/// Equation
/// Notion supports inline LaTeX equations as rich text object’s with a type value of "equation".
/// https://developers.notion.com/reference/rich-text#equation
class EquationConfigDTO extends RichTextConfigDTO {
  final String expression;

  const EquationConfigDTO({
    required this.expression,
  });

  factory EquationConfigDTO.fromJson(Map<String, dynamic> data) => EquationConfigDTO(
    expression: data['expression'] as String,
  );

  @override
  List<Object?> get props => [expression];
}


/// Mention
/// Mention objects represent an inline mention of a database, date, link preview mention, page, template mention, or user. 
/// A mention is created in the Notion UI when a user types @ followed by the name of the reference.
/// https://developers.notion.com/reference/rich-text#mention
class MentionConfigDTO extends RichTextConfigDTO {
  final MentionType type;
  final MentionDetailsDTO? details;

  const MentionConfigDTO({
    required this.type,
    required this.details,
  });

  factory MentionConfigDTO.fromJson(Map<String, dynamic> data) {
    final MentionType type = MentionType.values.byName(data['type'] as String);
    MentionDetailsDTO? details;

    switch(type){
      case MentionType.database:
        details = DatabaseMention.fromJson(data['database']);
        break;
      case MentionType.date:
        details = DateMention.fromJson(data['date']);
        break;
      case MentionType.link_preview:
        details = LinkPreviewMention.fromJson(data['link_preview']);
        break;
      case MentionType.page:
        details = PageMention.fromJson(data['page']);
        break;
      case MentionType.template_mention:
        details = TemplateMention.fromJson(data['template_mention']);
        break;
      case MentionType.user:
         details = UserMention.fromJson(data['user']);
        break;
      default:
        throw Exception('Invalid type (MentionType): $type');
    }

    return MentionConfigDTO(
      type: type,
      details: details,
    );
  }

  @override
  List<Object?> get props => [type, details];
}

enum MentionType {
  database,
  date,
  link_preview,
  page,
  template_mention,
  user,
}

/// Database mention type object
abstract class MentionDetailsDTO extends Equatable {
  const MentionDetailsDTO();

  @override
  List<Object?> get props => [];
}


/// https://developers.notion.com/reference/rich-text#database-mention-type-object
class DatabaseMention extends MentionDetailsDTO {
  final String id;

  const DatabaseMention({
    required this.id,
  });

  factory DatabaseMention.fromJson(Map<String, dynamic> data) => DatabaseMention(
    id: data['id'] as String,
  );

  @override
  List<Object?> get props => [id];
}


/// https://developers.notion.com/reference/rich-text#date-mention-type-object
class DateMention extends MentionDetailsDTO {
  final String start;
  final String? end;

  const DateMention({
    required this.start,
    required this.end,
  });

  factory DateMention.fromJson(Map<String, dynamic> data) => DateMention(
    start: data['start'] as String,
    end: data['end'],
  );

  @override
  List<Object?> get props => [start, end];
}


/// https://developers.notion.com/reference/rich-text#link-preview-mention-type-object
class LinkPreviewMention extends MentionDetailsDTO {
  final String url;

  const LinkPreviewMention({
    required this.url,
  });

  factory LinkPreviewMention.fromJson(Map<String, dynamic> data) => LinkPreviewMention(
    url: data['url'] as String,
  );

  @override
  List<Object?> get props => [url];
}


/// https://developers.notion.com/reference/rich-text#page-mention-type-object
class PageMention extends MentionDetailsDTO {
  final String id;

  const PageMention({
    required this.id,
  });

  factory PageMention.fromJson(Map<String, dynamic> data) => PageMention(
    id: data['id'] as String,
  );

  @override
  List<Object?> get props => [id];
}


/// https://developers.notion.com/reference/rich-text#template-mention-type-object
class TemplateMention extends MentionDetailsDTO {
  final String type;
  final dynamic templateMention; // type TemplateMentionDate or TemplateMentionUser

  const TemplateMention({
    required this.type,
    required this.templateMention,
  });

  factory TemplateMention.fromJson(Map<String, dynamic> data) {
    dynamic templateMention = data['type'] == 'template_mention_date' 
      ? TemplateMentionDate.values.byName(data['template_mention_date'])
      : TemplateMentionUser.values.byName(data['template_mention_user']);
    return TemplateMention(
      type: data['type'] as String,
      templateMention: templateMention,
    );
  }

  @override
  List<Object?> get props => [type, templateMention];
}

enum TemplateMentionDate {
  today,
  now,
}

enum TemplateMentionUser {
  me,
}


/// https://developers.notion.com/reference/rich-text#user-mention-type-object
class UserMention extends MentionDetailsDTO {
  final String object;
  final String id;

  const UserMention({
    required this.object,
    required this.id,
  });

  factory UserMention.fromJson(Map<String, dynamic> data) => UserMention(
    object: data['object'] as String,
    id: data['id'] as String,
  );

  @override
  List<Object?> get props => [object, id];
}


/// Annotations
/// The annotation object
/// https://developers.notion.com/reference/rich-text#the-annotation-object
class AnnotationsDTO extends Equatable {
  final bool bold;
  final bool italic;
  final bool strikethrough;
  final bool underline;
  final bool code;
  final String color;

  const AnnotationsDTO({
    required this.bold,
    required this.italic,
    required this.strikethrough,
    required this.underline,
    required this.code,
    required this.color,
  });

  factory AnnotationsDTO.fromJson(Map<String, dynamic> data) => AnnotationsDTO(
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
 
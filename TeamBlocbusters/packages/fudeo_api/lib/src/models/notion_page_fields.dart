import 'package:fudeo_api/src/models/notion_page_response.dart';

class NotionPageField {
  NotionPageField.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        type = json['type'] as String;
  final String id;
  final String type;
}

class NotionPageCreatedTimeField extends NotionPageField {
  NotionPageCreatedTimeField.fromJson(super.json)
      : createdTime = json['created_time'] as String,
        super.fromJson();
  String createdTime;
}

class NotionPageSelectField extends NotionPageField {
  NotionPageSelectField.fromJson(super.json)
      : select = json['select'] != null
            ? SelectOption.fromJson(json['select'] as Map<String, dynamic>)
            : null,
        super.fromJson();
  SelectOption? select;
}

class SelectOption {
  SelectOption.fromJson(
    Map<String, dynamic> json,
  )   : id = json['id'] as String,
        name = json['name'] as String,
        color = json['color'] as String;
  String id;
  String name;
  String color;
}

class NotionPageTitleField extends NotionPageField {
  NotionPageTitleField.fromJson(super.json)
      : title = (json['title'] as List<dynamic>)
            .map((e) => NotionPageText.fromJson(e as Map<String, dynamic>))
            .toList(),
        super.fromJson();
  List<NotionPageText> title;
}

class NotionPageText {
  NotionPageText.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String,
        text = Text.fromJson(json['text'] as Map<String, dynamic>),
        annotations = json['annotations'] != null
            ? Annotations.fromJson(json['annotations'] as Map<String, dynamic>)
            : null,
        plainText = json['plain_text'] as String,
        href = json['href'] as String?;
  String type;
  Text text;
  Annotations? annotations;
  String plainText;
  String? href;
}

class Text {
  Text.fromJson(Map<String, dynamic> json)
      : content = json['content'] as String,
        link = json['link'] != null
            ? UrlContainer.fromJson(json['link'] as Map<String, dynamic>)
            : null;
  String content;
  UrlContainer? link;
}

class Annotations {
  Annotations.fromJson(Map<String, dynamic> json)
      : bold = json['bold'] as bool,
        italic = json['italic'] as bool,
        strikethrough = json['strikethrough'] as bool,
        underline = json['underline'] as bool,
        code = json['code'] as bool,
        color = json['color'] as String;
  bool bold;
  bool italic;
  bool strikethrough;
  bool underline;
  bool code;
  String color;
}

class NotionPageRichTextField extends NotionPageField {
  NotionPageRichTextField.fromJson(super.json)
      : richText = (json['rich_text'] as List<dynamic>)
            .map((e) => NotionPageText.fromJson(e as Map<String, dynamic>))
            .toList(),
        super.fromJson();
  final List<NotionPageText> richText;
}

class RichTextNode {
  RichTextNode({required this.plainText, required this.annotations});

  String toHtml() {
    var htmlText = plainText
        .split('\n')
        .join('<br>');
    if (annotations.bold) htmlText = '<b>$htmlText</b>';
    if (annotations.italic) htmlText = '<i>$htmlText</i>';
    if (annotations.strikethrough) htmlText = '<s>$htmlText</s>';
    if (annotations.underline) htmlText = '<u>$htmlText</u>';
    if (annotations.code) htmlText = '<tt>$htmlText</tt>';
    if (annotations.color != 'default') {
      htmlText = '<font color="${annotations.color}">$htmlText</font>';
    }
    return htmlText;
  }

  final String plainText;
  final Annotations annotations;
}

class NotionPageUrlField extends NotionPageField {
  NotionPageUrlField.fromJson(super.json)
      : url = json['url'] as String?,
        super.fromJson();
  String? url;
}

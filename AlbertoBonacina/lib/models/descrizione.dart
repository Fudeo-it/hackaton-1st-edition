import 'package:soluzione1_hackathon_fudeo_flutter/models/notion_property_text.dart';

class Descrizione {
  late String text;
  late bool isBold;
  late bool isItalic;
  late bool isStrikethrough;
  late bool isUnderline;
  late bool isCode;
  late String color;

  Descrizione();

  Descrizione.fromNotionPropertyText(NotionPropertyText notionPropertyText) {
    text = notionPropertyText.plainText ?? notionPropertyText.text!.content;
    isBold = notionPropertyText.annotations!.bold;
    isItalic = notionPropertyText.annotations!.italic;
    isStrikethrough = notionPropertyText.annotations!.strikethrough;
    isUnderline = notionPropertyText.annotations!.underline;
    isCode = notionPropertyText.annotations!.code;
    color = notionPropertyText.annotations!.color;
  }
}

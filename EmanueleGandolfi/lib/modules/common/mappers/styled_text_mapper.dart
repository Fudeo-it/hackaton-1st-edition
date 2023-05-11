import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/helpers/dto_mapper.dart';
import 'package:offertelavoroflutter_app/modules/common/models/styled_text/styled_text.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/helpers/notion_color.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/rich_text/notion_rich_text.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/rich_text/rich_text_annotations/notion_rich_text_annotations.dart';

class StyledTextMapper extends DTOMapper<StyledText, NotionRichText> {
  @override
  StyledText fromDTO(NotionRichText notionRichText) {
    return notionRichText.map<StyledText>(
      text: (value) => StyledText(
        text: value.text.content,
        style: _getTextStyle(value.annotations),
        href: value.href
      ),
      mention: (value) => StyledText(
        text: value.plainText,
        style: _getTextStyle(value.annotations),
        href: value.href
      ),
      equation: (value) => StyledText(
        text: value.plainText,
        style: _getTextStyle(value.annotations),
        href: value.href
      ),
    );
  }

  TextStyle _getTextStyle(NotionRichTextAnnotations annotations) {
    return TextStyle(
      color: NotionColor.parseNotionColor(annotations.color),
      decoration: _getTextDecoration(annotations),
      fontWeight: annotations.bold ? FontWeight.bold : null,
      fontStyle: annotations.italic ? FontStyle.italic : null
    );
  }

  TextDecoration _getTextDecoration(NotionRichTextAnnotations annotations) {
    if(annotations.strikethrough) return TextDecoration.lineThrough;
    if(annotations.underline) return TextDecoration.underline;

    return TextDecoration.none;
  }
  
}
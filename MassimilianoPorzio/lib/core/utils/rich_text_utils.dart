import 'dart:ui';

import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

import '../domain/entities/typedefs.dart';

Widget getWidgetFromRichTextEntity(RichTextList richTextList,
    [bool isFreelancers = false]) {
  String plainText = '';
  var patternList = <EasyRichTextPattern>[];
  for (var richTextEntity in richTextList) {
    if (richTextEntity.plainText.isNotEmpty) {
      plainText += richTextEntity.plainText;
      if (!richTextEntity.annotation.isPlain()) {
        var annotation = richTextEntity.annotation;
        var listDecoration = <TextDecoration>[];
        if (annotation.strikethrough) {
          listDecoration.add(TextDecoration.lineThrough);
        }
        if (annotation.underline) {
          listDecoration.add(TextDecoration.underline);
        }
        var listFeatures = <FontFeature>[];
        if (annotation.code) {
          listFeatures.add(const FontFeature.tabularFigures());
        }
        var style = TextStyle(
          fontWeight: annotation.bold ? FontWeight.bold : FontWeight.normal,
          fontStyle: annotation.italic ? FontStyle.italic : FontStyle.normal,
          decoration: TextDecoration.combine(listDecoration),
          fontFeatures: listFeatures,
        );

        patternList.add(EasyRichTextPattern(
            hasSpecialCharacters: true,
            targetString: richTextEntity.plainText,
            style: style));
      }
    }
  }
  if (isFreelancers) {
  } else {
    plainText += "\n\n\n\n\n\n\n"; //se è in fondo alla pagina
  }

  var result = Column(
    children: [
      EasyRichText(
        plainText,
        overflow: TextOverflow.fade,
        textAlign: TextAlign.left,
        patternList: patternList,
      ),
    ],
  );
  return result;
}

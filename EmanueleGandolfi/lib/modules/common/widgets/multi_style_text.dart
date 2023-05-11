import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/helpers/app_url_launcher.dart';
import 'package:offertelavoroflutter_app/modules/common/models/styled_text/styled_text.dart';


class MultiStyleText extends StatelessWidget {
  final List<StyledText> items;
  final TextStyle? baseStyle;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;

  const MultiStyleText({Key? key, required this.items, this.baseStyle,
    this.textAlign = TextAlign.start, this.maxLines, this.overflow = TextOverflow.clip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      text: TextSpan(
        children: items.map(_buildTextSpan).toList()
      )
    );
  }

  TextSpan _buildTextSpan(StyledText styledText) {
    TextStyle? style = baseStyle?.merge(styledText.style);
    if(styledText.href != null) {
      style = style?.copyWith(
        decoration: TextDecoration.underline
      );
    }

    return TextSpan(
      text: styledText.text,
      style: style,
      recognizer: _getGestureRecognizer(styledText)
    );
  }

  GestureRecognizer? _getGestureRecognizer(StyledText styledText) {
    if(styledText.href == null) return null;

    return TapGestureRecognizer()..onTap = () => AppUrlLauncher.openUrlInBrowser(styledText.href!);
  }
}

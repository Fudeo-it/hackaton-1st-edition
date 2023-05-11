import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AutoSizeTextWidget extends StatelessWidget {
  final String text;
  final double minFontSize;
  final double maxFontSize;
  final TextStyle? style;
  final TextAlign? textAlign;
  const AutoSizeTextWidget(
    this.text, {
    Key? key,
    this.minFontSize = 8.0,
    this.maxFontSize = 10.0,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      textAlign: textAlign,
      minFontSize: minFontSize,
      maxFontSize: maxFontSize,
      maxLines: 2,
      style: style,
      overflow: TextOverflow.ellipsis,
    );
  }
}

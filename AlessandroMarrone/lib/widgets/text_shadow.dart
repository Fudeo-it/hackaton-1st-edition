import 'package:flutter/material.dart';

class TextShadow extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final String? semanticsLabel;
  const TextShadow(
      {Key? key,
      required this.text,
      this.color,
      this.fontWeight,
      this.fontSize = 12.0,
      this.semanticsLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      semanticsLabel: semanticsLabel,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        shadows: const <Shadow>[
          Shadow(
            offset: Offset(0, 1),
            blurRadius: 5.0,
            color: Color.fromARGB(150, 0, 0, 0),
          ),
        ],
      ),
    );
  }
}

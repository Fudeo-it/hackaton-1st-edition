import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class FormattedText extends Equatable {
  final String text;
  final String? url;
  final bool bold;
  final bool italic;
  final bool strikethrough;
  final bool underline;

  const FormattedText({
    required this.text,
    this.url,
    this.bold = false,
    this.italic = false,
    this.strikethrough = false,
    this.underline = false,
  });

  @override
  List<Object?> get props => [
        text,
        url,
        bold,
        italic,
        strikethrough,
        underline,
      ];

  FontWeight? get fontWeight => bold ? FontWeight.bold : null;
  FontStyle? get fontStyle => italic ? FontStyle.italic : null;
  TextDecoration? get decoration {
    if (underline && strikethrough) {
      return TextDecoration.combine(
        [
          TextDecoration.lineThrough,
          TextDecoration.underline,
        ],
      );
    }
    if (underline) {
      return TextDecoration.underline;
    }
    if (strikethrough) {
      return TextDecoration.lineThrough;
    }
    return null;
  }
}

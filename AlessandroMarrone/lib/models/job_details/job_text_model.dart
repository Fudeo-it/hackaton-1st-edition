import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class JobTextModel extends Equatable {
  final String text;
  final String? url;
  final String? plainText;
  final String? href;
  final TextStyle? style;

  const JobTextModel({
    required this.text,
    this.style,
    this.url,
    this.plainText,
    this.href,
  });
  @override
  List<Object?> get props => [text, style, url, plainText, href];
}

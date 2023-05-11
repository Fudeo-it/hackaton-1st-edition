import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'styled_text.freezed.dart';

@freezed
class StyledText with _$StyledText {

  const factory StyledText({
    required String text,
    required TextStyle style,
    required String? href,
  }) = _StyledText;
}
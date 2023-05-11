import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_option.freezed.dart';

@freezed
class SelectOption with _$SelectOption {

  const factory SelectOption({
    required String id,
    required String name,
    required Color? color,
  }) = _SelectOption;
}
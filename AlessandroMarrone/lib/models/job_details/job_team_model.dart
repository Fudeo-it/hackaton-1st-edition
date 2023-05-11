// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class JobSelectModel extends Equatable {
  final String text;
  final Color? sectionColor;

  const JobSelectModel({
    required this.text,
    this.sectionColor,
  });
  @override
  List<Object?> get props => [text, sectionColor];
}

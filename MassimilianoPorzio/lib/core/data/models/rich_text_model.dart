import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'rich_text_annotation_model.dart';

class RichTextModel extends Equatable {
  final String plainText;
  final RichTextAnnotationModel annotation;
  const RichTextModel({
    required this.plainText,
    required this.annotation,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'plainText': plainText});
    result.addAll(
        {'annotation': (annotation).toMap()});

    return result;
  }

  factory RichTextModel.fromJson(Map<String, dynamic> map) {
    return RichTextModel(
      plainText: map['plainText'] ?? '',
      annotation: RichTextAnnotationModel.fromJson(map['annotation']),
    );
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object> get props => [plainText, annotation];
}

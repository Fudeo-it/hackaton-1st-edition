import 'dart:convert';

import 'package:equatable/equatable.dart';

class RichTextAnnotationModel extends Equatable {
  final bool bold;
  final bool italic;
  final bool strikethrough;
  final bool underline;
  final bool code;
  final String? colorString;

  const RichTextAnnotationModel({
    required this.bold,
    required this.italic,
    required this.strikethrough,
    required this.underline,
    required this.code,
    this.colorString,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'bold': bold});
    result.addAll({'italic': italic});
    result.addAll({'strikethrough': strikethrough});
    result.addAll({'underline': underline});
    result.addAll({'code': code});
    if (colorString != null) {
      result.addAll({'colorString': colorString});
    }

    return result;
  }

  factory RichTextAnnotationModel.fromJson(Map<String, dynamic> map) {
    return RichTextAnnotationModel(
      bold: map['bold'] ?? false,
      italic: map['italic'] ?? false,
      strikethrough: map['strikethrough'] ?? false,
      underline: map['underline'] ?? false,
      code: map['code'] ?? false,
      colorString: map['colorString'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      bold,
      italic,
      strikethrough,
      underline,
      code,
      colorString,
    ];
  }
}

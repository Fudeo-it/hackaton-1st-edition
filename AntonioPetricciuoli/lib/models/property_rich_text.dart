import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter/models/models.dart';

class PropertyRichText extends Equatable {
  final String? id;
  final String? type;
  final List<RichText>? richText;

  const PropertyRichText({this.id, this.type, this.richText});

  factory PropertyRichText.fromJson(Map<String, dynamic> json) {
    return PropertyRichText(
      id: json['id'] as String?,
      type: json['type'] as String?,
      richText: json['rich_text'] != null
          ? (json['rich_text'] as List<dynamic>)
              .map((e) => RichText.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'rich_text': richText?.map((e) => e.toJson()).toList(),
    };
  }

  PropertyRichText copyWith({
    String? id,
    String? type,
    List<RichText>? richText,
  }) {
    return PropertyRichText(
      id: id ?? this.id,
      type: type ?? this.type,
      richText: richText ?? this.richText,
    );
  }

  @override
  List<Object?> get props => [id, type, richText];
}

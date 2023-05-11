import 'package:equatable/equatable.dart';

class RichText extends Equatable {
  final String? type;
  final String? plainText;

  const RichText({this.type, this.plainText});

  factory RichText.fromJson(Map<String, dynamic> json) {
    return RichText(
      type: json['type'] as String?,
      plainText: json['plain_text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'plain_text': plainText,
    };
  }

  RichText copyWith({String? type, String? plainText}) {
    return RichText(
      type: type ?? this.type,
      plainText: plainText ?? this.plainText,
    );
  }

  @override
  List<Object?> get props => [type, plainText];
}

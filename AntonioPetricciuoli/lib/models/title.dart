import 'package:equatable/equatable.dart';

class Title extends Equatable {
  final String? type;
  final String? plainText;

  const Title({this.type, this.plainText});

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
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

  Title copyWith({String? type, String? plainText}) {
    return Title(
      type: type ?? this.type,
      plainText: plainText ?? this.plainText,
    );
  }

  @override
  List<Object?> get props => [type, plainText];
}

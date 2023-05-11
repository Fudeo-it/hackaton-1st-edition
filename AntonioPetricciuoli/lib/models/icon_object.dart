import 'package:equatable/equatable.dart';

class IconObject extends Equatable {
  final String? type;
  final String? emoji;

  const IconObject({this.type, this.emoji});

  factory IconObject.fromJson(Map<String, dynamic> json) {
    return IconObject(
      type: json['type'] as String?,
      emoji: json['emoji'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'emoji': emoji,
    };
  }

  IconObject copyWith({String? type, String? emoji}) {
    return IconObject(
      type: type ?? this.type,
      emoji: emoji ?? this.emoji,
    );
  }

  @override
  List<Object?> get props => [type, emoji];
}

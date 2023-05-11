import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter/models/models.dart';

class PropertyTitle extends Equatable {
  final String? id;
  final String? type;
  final List<Title> title;

  const PropertyTitle({this.id, this.type, required this.title});

  factory PropertyTitle.fromJson(Map<String, dynamic> json) {
    return PropertyTitle(
      id: json['id'] as String?,
      type: json['type'] as String?,
      title: (json['title'] as List<dynamic>)
          .map((e) => Title.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'title': title.map((e) => e.toJson()).toList(),
    };
  }

  PropertyTitle copyWith({String? id, String? type, List<Title>? title}) {
    return PropertyTitle(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [id, type, title];
}

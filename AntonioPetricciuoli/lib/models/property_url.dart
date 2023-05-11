import 'package:equatable/equatable.dart';

class PropertyUrl extends Equatable {
  final String? id;
  final String? name;
  final String? type;
  final String? url;

  const PropertyUrl({this.id, this.name, this.type, this.url});

  factory PropertyUrl.fromJson(Map<String, dynamic> json) {
    return PropertyUrl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'url': url,
    };
  }

  PropertyUrl copyWith({String? id, String? name, String? type, String? url}) {
    return PropertyUrl(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      url: url ?? this.url,
    );
  }

  @override
  List<Object?> get props => [id, name, type, url];
}

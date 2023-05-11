import 'package:equatable/equatable.dart';

class Select extends Equatable {
  final String? id;
  final String? name;
  final String? color;

  const Select({this.id, this.name, this.color});

  factory Select.fromJson(Map<String, dynamic> json) {
    return Select(
      id: json['id'] as String?,
      name: json['name'] as String?,
      color: json['color'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }

  Select copyWith({String? id, String? name, String? color}) {
    return Select(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  @override
  List<Object?> get props => [id, name, color];
}

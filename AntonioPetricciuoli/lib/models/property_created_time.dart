import 'package:equatable/equatable.dart';

class PropertyCreatedTime extends Equatable {
  final String? id;
  final String? type;
  final String? createdTime;

  const PropertyCreatedTime({this.id, this.type, this.createdTime});

  factory PropertyCreatedTime.fromJson(Map<String, dynamic> json) {
    return PropertyCreatedTime(
      id: json['id'] as String?,
      type: json['type'] as String?,
      createdTime: json['created_time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'created_time': createdTime,
    };
  }

  PropertyCreatedTime copyWith(
      {String? id, String? type, String? createdTime}) {
    return PropertyCreatedTime(
      id: id ?? this.id,
      type: type ?? this.type,
      createdTime: createdTime ?? this.createdTime,
    );
  }

  @override
  List<Object?> get props => [id, type, createdTime];
}

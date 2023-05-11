import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter/models/models.dart';

class PropertySelect extends Equatable {
  final String? id;
  final String? type;
  final Select? select;

  const PropertySelect({this.id, this.type, this.select});

  factory PropertySelect.fromJson(Map<String, dynamic> json) {
    return PropertySelect(
      id: json['id'] as String?,
      type: json['type'] as String?,
      select: json['select'] == null
          ? null
          : Select.fromJson(json['select'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'select': select?.toJson(),
    };
  }

  PropertySelect copyWith({String? id, String? type, Select? select}) {
    return PropertySelect(
      id: id ?? this.id,
      type: type ?? this.type,
      select: select ?? this.select,
    );
  }

  @override
  List<Object?> get props => [id, type, select];
}

import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter/models/models.dart';

class NotionObject extends Equatable {
  final String? id;
  final String? createdTime;
  final IconObject? icon;
  final PropertiesObject? propertiesObject;

  const NotionObject({
    this.id,
    this.createdTime,
    this.icon,
    this.propertiesObject,
  });

  factory NotionObject.fromJson(Map<String, dynamic> json) {
    return NotionObject(
      id: json['id'] as String?,
      createdTime: json['created_time'] as String?,
      icon: json['icon'] == null
          ? null
          : IconObject.fromJson(json['icon'] as Map<String, dynamic>),
      propertiesObject: json['properties'] == null
          ? null
          : PropertiesObject.fromJson(
              json['properties'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_time': createdTime,
      'icon': icon?.toJson(),
      'properties': propertiesObject?.toJson(),
    };
  }

  NotionObject copyWith({
    String? id,
    String? createdTime,
    IconObject? icon,
    PropertiesObject? propertiesObject,
  }) {
    return NotionObject(
      id: id ?? this.id,
      createdTime: createdTime ?? this.createdTime,
      icon: icon ?? this.icon,
      propertiesObject: propertiesObject ?? this.propertiesObject,
    );
  }

  @override
  List<Object?> get props {
    return [id, createdTime, icon, propertiesObject];
  }
}

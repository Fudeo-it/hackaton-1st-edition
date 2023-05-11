import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:pine/dto/dto.dart';

class JobPostedDTO extends DTO with EquatableMixin {
  final String id;
  final String type;
  final String createdTime;

  JobPostedDTO({
    required this.id,
    required this.type,
    required this.createdTime,
  });

  factory JobPostedDTO.fromJson(Map<String, dynamic> json) => JobPostedDTO(
        id: json[K.idKey],
        type: json[K.typeKey],
        createdTime: json[K.createdTimeKey],
      );

  @override
  List<Object?> get props => [
        id,
        type,
        createdTime,
      ];
}

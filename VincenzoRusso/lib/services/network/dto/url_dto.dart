import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:offertelavoroflutter_app/services/network/dto/property_dto.dart';

class UrlDTO extends PropertyDTO with EquatableMixin {
  final String? url;

  UrlDTO({
    super.id,
    super.type,
    required this.url,
  });

  factory UrlDTO.fromJson(Map<String, dynamic> json) => UrlDTO(
        id: json[K.idKey],
        type: json[K.typeKey],
        url: json[K.urlKey],
      );

  @override
  List<Object?> get props => [
        id,
        type,
        url,
      ];
}

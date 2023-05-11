import 'package:pine/dto/dto.dart';

abstract class PropertyDTO extends DTO {
  final String? id;
  final String? type;

  PropertyDTO({
    required this.id,
    required this.type,
  });
}

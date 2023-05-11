import 'package:equatable/equatable.dart';

import '../enums/nda.dart';

class NdaEntity extends Equatable {
  final NDA nda;
  final String? backgroundColorString;
  const NdaEntity({
    required this.nda,
    this.backgroundColorString,
  });

  @override
  List<Object?> get props => [nda];

  @override
  bool? get stringify => true;
}

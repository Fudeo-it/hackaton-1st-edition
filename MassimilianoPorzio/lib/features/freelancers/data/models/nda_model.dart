import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../domain/enums/nda.dart';

class NdaModel extends Equatable {
  final NDA nda;
  final String? backgroundColorString;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nda': nda.toJson()});
    if (backgroundColorString != null) {
      result.addAll({'backgroundColorString': backgroundColorString});
    }

    return result;
  }

  factory NdaModel.fromJson(Map<String, dynamic> json) {
    return NdaModel(
      nda: NDA.fromJson(json['nda']),
      backgroundColorString: json['backgroundColorString'],
    );
  }

  String toJson() => json.encode(toMap());

  const NdaModel({
    required this.nda,
    this.backgroundColorString,
  });

  @override
  List<Object?> get props => [nda, backgroundColorString];
}

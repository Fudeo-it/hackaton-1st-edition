import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../domain/enums/contratto.dart';

class ContrattoModel extends Equatable {
  final Contratto contratto;
  final String? backgroundColorString;

  const ContrattoModel({
    required this.contratto,
    this.backgroundColorString,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'contratto': contratto.toJson()});
    if (backgroundColorString != null) {
      result.addAll({'backgroundColorString': backgroundColorString});
    }

    return result;
  }

  factory ContrattoModel.fromJson(Map<String, dynamic> json) {
    return ContrattoModel(
      contratto: Contratto.fromJson(json['contratto']),
      backgroundColorString: json['backgroundColorString'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [contratto, backgroundColorString];
}

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:job_app/features/freelancers/domain/enums/relazione.dart';

class RelazioneModel extends Equatable {
  final Relazione relazione;
  final String? backgroundColorString;

  const RelazioneModel({
    required this.relazione,
    this.backgroundColorString,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'relazione': relazione.toJson()});
    if (backgroundColorString != null) {
      result.addAll({'backgroundColorString': backgroundColorString});
    }

    return result;
  }

  factory RelazioneModel.fromJson(Map<String, dynamic> json) {
    return RelazioneModel(
      relazione: Relazione.fromJson(json['relazione']),
      backgroundColorString: json['backgroundColorString'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [relazione, backgroundColorString];
}

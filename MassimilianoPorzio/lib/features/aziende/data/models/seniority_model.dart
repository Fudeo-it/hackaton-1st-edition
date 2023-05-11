import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../domain/enums/seniority.dart';

class SeniorityModel extends Equatable {
  final Seniority seniority;
  final String? backgroundColorString;
  const SeniorityModel({
    required this.seniority,
    this.backgroundColorString,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'seniority': seniority.toJson()});
    if (backgroundColorString != null) {
      result.addAll({'backgroundColorString': backgroundColorString});
    }

    return result;
  }

  factory SeniorityModel.fromJson(Map<String, dynamic> json) {
    return SeniorityModel(
      seniority: Seniority.fromJson(json['seniority']),
      backgroundColorString: json['backgroundColorString'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [seniority, backgroundColorString];
}

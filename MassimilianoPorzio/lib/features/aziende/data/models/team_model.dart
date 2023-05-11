import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../domain/enums/team.dart';

class TeamModel extends Equatable {
  final Team team;
  final String? backgroundColorString;
  const TeamModel({
    required this.team,
    this.backgroundColorString,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'team': team.toJson()});
    if (backgroundColorString != null) {
      result.addAll({'backgroundColorString': backgroundColorString});
    }

    return result;
  }

  String toJson() => json.encode(toMap());

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      team: Team.fromJson(json['team']),
      backgroundColorString: json['backgroundColorString'],
    );
  }

  @override
  List<Object?> get props => [team, backgroundColorString];
}

import 'package:equatable/equatable.dart';

import '../enums/team.dart';

// import '../../utils/mixins.dart';

class TeamEntity extends Equatable {
  final Team team;
  final String? backgroundColorString;

  const TeamEntity({
    required this.team,
    this.backgroundColorString,
  });

  @override
  List<Object> get props => [team];

  @override
  bool? get stringify => true;
}

import 'package:annunci_lavoro_flutter/models/ads_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//ignore: must_be_immutable
class JobPosition extends AdsModel {
  ///
  /// modello dell'oggeto [JobPosition].
  ///
  final String company;
  final Team? jobLocation;
  final ContractType? contractType;
  final Seniority? seniority;
  final String? workLocation;
  final String jobQualification;
  final String? remuneration;
  final String? webSiteURL;
  final String? ral;
  late IconData? teamIcon;

  JobPosition({
    required super.metaData,
    required super.adsTitle,
    required super.postedDate,
    required super.applyLink,
    required super.isFavourite,
    required super.adsDescription,
    required super.adsUrl,
    required this.company,
    required this.jobLocation,
    required this.contractType,
    required this.seniority,
    required this.workLocation,
    required this.jobQualification,
    required this.remuneration,
    required this.webSiteURL,
    required this.ral,
  }) {
    teamIcon = _iconFromTeam();
  }

  @override
  List<Object?> get props => [
        ...super.props,
        company,
        jobLocation,
        contractType,
        seniority,
        workLocation,
        jobQualification,
        remuneration,
        webSiteURL,
      ];

  /// ritorna solo il titolo dell'annuncio.
  String get onlyTitle => adsTitle.split('|')[0].trim();

  /// ritorna una stringa  a seconda del valore di [Seniority]
  String? mapSeniorityString() {
    switch (seniority) {
      case Seniority.junior:
        return 'Junior';
      case Seniority.mid:
        return 'Mid';
      case Seniority.senior:
        return 'Senior';
      default:
        return null;
    }
  }

  /// ritorna una stringa  a seconda del valore di [Team]
  String? mapTeamString() {
    switch (jobLocation) {
      case Team.onSite:
        return 'In sede';
      case Team.hybrid:
        return 'Ibrido';
      case Team.remote:
        return 'Remoto';
      default:
        return null;
    }
  }

  /// ritorna una stringa  a seconda del valore di [ContractType]
  String? mapContractTypeString() {
    if (contractType == ContractType.partTime) {
      return 'Part time';
    } else if (contractType == ContractType.fullTime) {
      return 'Full time';
    }
    return null;
  }

  /// ritorna il valore di [Seniority] a seconda della stringa passata
  static Seniority? mapSeniorityEnum(String seniority) {
    if (seniority == 'Junior') {
      return Seniority.junior;
    } else if (seniority == 'Mid') {
      return Seniority.mid;
    } else if (seniority == 'Senior') {
      return Seniority.senior;
    }
    return null;
  }

  /// ritorna il valore di [ContractType] a seconda della stringa passata
  static ContractType? mapContractEnum(String contract) {
    if (contract == 'Part time') {
      return ContractType.partTime;
    } else if (contract == 'Full time') {
      return ContractType.fullTime;
    }
    return null;
  }

  /// ritorna il valore di [Team] a seconda della stringa passata
  static Team? mapTeamEnum(String team) {
    if (team == 'In sede') {
      return Team.onSite;
    } else if (team == 'Ibrido') {
      return Team.hybrid;
    } else if (team == 'Remoto') {
      return Team.remote;
    }
    return null;
  }

  /// ritorna un [IconData] a seconda del valore di [Team]
  IconData _iconFromTeam() {
    if (jobLocation == Team.onSite) {
      return FontAwesomeIcons.building;
    } else if (jobLocation == Team.hybrid) {
      return FontAwesomeIcons.houseLaptop;
    } else if (jobLocation == Team.remote) {
      return FontAwesomeIcons.globe;
    }
    return FontAwesomeIcons.building;
  }

  /// ritorna un [Color] a seconda del valore di [Seniority]
  Color getSeniorityColor(Seniority seniority, bool mode) {
    switch (seniority) {
      case Seniority.junior:
        return mode ? Colors.green.shade700 : Colors.green.shade100;
      case Seniority.mid:
        return mode ? Colors.orangeAccent.shade700 : Colors.amber.shade100;
      case Seniority.senior:
        return mode ? Colors.red.shade700 : Colors.red.shade100;
    }
  }

  /// ritorna un [Color] a seconda del valore di [Team]
  Color getTeamColor(Team team, bool mode) {
    switch (team) {
      case Team.onSite:
        return mode ? Colors.red.shade700 : Colors.red.shade100;
      case Team.hybrid:
        return mode ? Colors.orangeAccent.shade700 : Colors.amber.shade100;
      case Team.remote:
        return mode ? Colors.purple.shade700 : Colors.purple.shade100;
    }
  }

  /// ritorna un [Color] a seconda del valore di [ContractType]
  Color getContractColor(ContractType contract, bool mode) {
    switch (contract) {
      case ContractType.partTime:
        return mode ? Colors.green.shade700 : Colors.green.shade100;
      case ContractType.fullTime:
        return mode ? Colors.blue.shade700 : Colors.blue.shade100;
    }
  }
}

enum Team {
  hybrid,
  onSite,
  remote,
}

enum ContractType {
  fullTime,
  partTime,
}

enum Seniority {
  junior,
  mid,
  senior,
}

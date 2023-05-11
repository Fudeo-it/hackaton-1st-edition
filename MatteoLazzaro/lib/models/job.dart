import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:equatable/equatable.dart';

enum Team {
  inSede,
  ibrido,
  fullRemote,
}

enum Contratto {
  fullTime,
  partTime,
}

enum Seniority {
  junior,
  mid,
  senior,
}

class Job extends Equatable {
  final String name;
  final String? qualifica;
  final String nomeAzienda;
  final Team? team;
  final Contratto? contratto;
  final Seniority? seniority;
  final String? retribuzione;
  final EasyRichText descrizioneOfferta;
  final String comeCandidarsi;
  final String? localita;
  final String? urlSitoWeb;
  final DateTime jobPosted;

  const Job({
    required this.name,
    required this.qualifica,
    required this.nomeAzienda,
    required this.team,
    required this.contratto,
    required this.seniority,
    required this.retribuzione,
    required this.descrizioneOfferta,
    required this.comeCandidarsi,
    required this.localita,
    required this.urlSitoWeb,
    required this.jobPosted,
  });

  @override
  List<Object?> get props => [
        name,
        qualifica,
        nomeAzienda,
        team,
        contratto,
        seniority,
        retribuzione,
        descrizioneOfferta,
        comeCandidarsi,
        localita,
        urlSitoWeb,
        jobPosted,
      ];
}

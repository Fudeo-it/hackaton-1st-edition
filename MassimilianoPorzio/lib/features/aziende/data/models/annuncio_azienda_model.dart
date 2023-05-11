import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:job_app/core/data/models/rich_text_model.dart';

import 'package:job_app/core/data/models/weblink_model.dart';
import 'package:job_app/core/domain/enums/tipologia_annunci.dart';
import 'package:job_app/features/aziende/data/models/seniority_model.dart';
import 'package:job_app/features/aziende/data/models/team_model.dart';

import 'contratto_model.dart';

class AnnuncioAziendaModel extends Equatable {
  final String id;
  final String titolo;
  final String? qualifica;
  final WebLinkModel nomeAzienda;
  final TeamModel? team;
  final ContrattoModel? contratto;
  final SeniorityModel? seniority;
  final String? retribuzione;
  final List<RichTextModel> descrizioneOfferta;
  final WebLinkModel comeCandidarsi;
  final WebLinkModel? urlAnnuncio;
  final String? localita;
  final String? emoji;
  final DateTime jobPosted;
  final bool archived;
  final TipoAnnuncio tipoAnnuncio;

  const AnnuncioAziendaModel(
      {required this.id,
      required this.titolo,
      this.qualifica,
      required this.nomeAzienda,
      this.team,
      this.contratto,
      this.seniority,
      this.retribuzione,
      required this.descrizioneOfferta,
      required this.comeCandidarsi,
      this.localita,
      this.emoji,
      required this.jobPosted,
      required this.archived,
      required this.tipoAnnuncio,
      this.urlAnnuncio});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'titolo': titolo});
    if (qualifica != null) {
      result.addAll({'qualifica': qualifica});
    }

    if (team != null) {
      result.addAll({'team': team!.toMap()});
    }
    if (contratto != null) {
      result.addAll({'contratto': contratto!.toMap()});
    }
    if (seniority != null) {
      result.addAll({'seniority': seniority!.toMap()});
    }
    if (retribuzione != null) {
      result.addAll({'retribuzione': retribuzione});
    }
    result.addAll({
      'descrizioneOfferta': (descrizioneOfferta).map((x) => x.toMap()).toList()
    });
    result.addAll({'comeCandidarsi': (comeCandidarsi).toMap()});
    if (urlAnnuncio != null) {
      result.addAll({'urlAnnuncio': urlAnnuncio!.toMap()});
    }
    result.addAll({'nomeAzienda': (nomeAzienda).toMap()});
    if (localita != null) {
      result.addAll({'localita': localita});
    }
    if (emoji != null) {
      result.addAll({'emoji': emoji});
    }
    result.addAll({'jobPosted': jobPosted.millisecondsSinceEpoch});
    result.addAll({'archived': archived});

    result.addAll({'tipoAnnuncio': tipoAnnuncio.name});

    return result;
  }

  factory AnnuncioAziendaModel.fromJson(Map<String, dynamic> map) {
    return AnnuncioAziendaModel(
        id: map['id'] ?? '',
        titolo: map['titolo'] ?? '',
        qualifica: map['qualifica'],
        team: map["team"] != null ? TeamModel.fromJson(map["team"]) : null,
        contratto: map['contratto'] != null
            ? ContrattoModel.fromJson(map['contratto'])
            : null,
        seniority: map['seniority'] != null
            ? SeniorityModel.fromJson(map['seniority'])
            : null,
        retribuzione: map['retribuzione'],
        descrizioneOfferta: List<RichTextModel>.from(
            map['descrizioneOfferta']?.map((x) => RichTextModel.fromJson(x))),
        comeCandidarsi: WebLinkModel.fromJson(map['comeCandidarsi']),
        urlAnnuncio: map['urlAnnuncio'] != null
            ? WebLinkModel.fromJson(map['urlAnnuncio'])
            : null,
        nomeAzienda: WebLinkModel.fromJson(map['nomeAzienda']),
        localita: map['localita'],
        emoji: map['emoji'],
        jobPosted: DateTime.fromMillisecondsSinceEpoch(map['jobPosted']),
        archived: map['archived'] ?? false,
        tipoAnnuncio: TipoAnnuncio.values.byName(map['tipoAnnuncio']));
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      titolo,
      qualifica,
      nomeAzienda,
      team,
      contratto,
      seniority,
      retribuzione,
      descrizioneOfferta,
      comeCandidarsi,
      localita,
      emoji,
      jobPosted,
      archived,
      urlAnnuncio
    ];
  }
}

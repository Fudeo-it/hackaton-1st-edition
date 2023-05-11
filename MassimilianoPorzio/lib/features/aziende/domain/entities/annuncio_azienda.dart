import 'package:equatable/equatable.dart';

import 'package:job_app/core/domain/enums/tipologia_annunci.dart';

import '../../../../core/domain/entities/typedefs.dart';
import '../../../../core/domain/entities/weblink.dart';
import 'contratto_entity.dart';
import 'seniority_enitity.dart';
import 'team_entity.dart';

class AnnuncioAzienda extends Equatable {
  final String id;
  final String titolo;
  final String? qualifica;
  final WebLink nomeAzienda;
  final TeamEntity? team;
  final ContrattoEntity? contratto;
  final SeniorityEntity? seniority;
  final String? retribuzione;
  final RichTextList descrizioneOfferta;
  final WebLink comeCandidarsi;
  final WebLink? urlAnnuncio;
  final String? localita;
  final String? emoji;
  final DateTime jobPosted;
  final bool archived;
  final bool preferito;

  final TipoAnnuncio tipoAnnuncio = TipoAnnuncio.aziende;

  String get plainDescrizioneOfferta {
    String result = "";
    for (var element in descrizioneOfferta) {
      result += element.plainText;
    }
    return result;
  }

  const AnnuncioAzienda(
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
      this.preferito = false,
      this.urlAnnuncio});

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
      preferito,
      urlAnnuncio
    ];
  }

  AnnuncioAzienda copyWith({
    String? id,
    String? titolo,
    String? qualifica,
    WebLink? nomeAzienda,
    TeamEntity? team,
    ContrattoEntity? contratto,
    SeniorityEntity? seniority,
    String? retribuzione,
    RichTextList? descrizioneOfferta,
    WebLink? comeCandidarsi,
    String? localita,
    String? emoji,
    DateTime? jobPosted,
    bool? archived,
    bool? preferito,
    TipoAnnuncio? tipoAnnuncio,
  }) {
    return AnnuncioAzienda(
      id: id ?? this.id,
      titolo: titolo ?? this.titolo,
      qualifica: qualifica ?? this.qualifica,
      nomeAzienda: nomeAzienda ?? this.nomeAzienda,
      team: this.team,
      contratto: this.contratto,
      seniority: this.seniority,
      retribuzione: retribuzione ?? this.retribuzione,
      descrizioneOfferta: descrizioneOfferta ?? this.descrizioneOfferta,
      comeCandidarsi: comeCandidarsi ?? this.comeCandidarsi,
      urlAnnuncio: urlAnnuncio,
      localita: localita ?? this.localita,
      emoji: emoji ?? this.emoji,
      jobPosted: jobPosted ?? this.jobPosted,
      archived: archived ?? this.archived,
      preferito: preferito ?? this.preferito,
    );
  }
}

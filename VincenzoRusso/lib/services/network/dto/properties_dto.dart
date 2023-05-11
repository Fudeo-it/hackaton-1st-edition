import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:offertelavoroflutter_app/services/network/dto/created_time_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/rich_text_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/select_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/title_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/url_dto.dart';
import 'package:pine/dto/dto.dart';

class PropertiesDTO extends DTO with EquatableMixin {
  final CreatedTimeDTO? jobPosted;
  final SelectDTO? team;
  final SelectDTO? contratto;
  final SelectDTO? seniority;
  final SelectDTO? ral;
  final TitleDTO? name;
  final RichTextDTO? qualifica;
  final RichTextDTO? retribuzione;
  final RichTextDTO? descrizioneOfferta;
  final RichTextDTO? comeCandidarsi;
  final RichTextDTO? localita;
  final RichTextDTO? nomeAzienda;
  final RichTextDTO? statoDiPubblicazione;
  final UrlDTO? urlSitoWeb;
  final RichTextDTO? tempistiche;
  final RichTextDTO? richiestaDiLavoro;
  final RichTextDTO? budget;
  final SelectDTO? nda;
  final TitleDTO? codice;
  final RichTextDTO? tempisticheDiPagamento;
  final RichTextDTO? descrizioneDelProgetto;
  final SelectDTO? tipoDiRelazione;

  PropertiesDTO({
    required this.jobPosted,
    required this.team,
    required this.contratto,
    required this.seniority,
    required this.ral,
    required this.name,
    required this.qualifica,
    required this.retribuzione,
    required this.descrizioneOfferta,
    required this.comeCandidarsi,
    required this.localita,
    required this.nomeAzienda,
    required this.statoDiPubblicazione,
    required this.urlSitoWeb,
    required this.tempistiche,
    required this.richiestaDiLavoro,
    required this.budget,
    required this.nda,
    required this.codice,
    required this.tempisticheDiPagamento,
    required this.descrizioneDelProgetto,
    required this.tipoDiRelazione,
  });

  factory PropertiesDTO.fromJson(Map<String, dynamic> json) => PropertiesDTO(
        jobPosted: json[K.jobPostedKey] == null
            ? null
            : CreatedTimeDTO.fromJson(json[K.jobPostedKey]),
        team: json[K.teamKey] == null
            ? null
            : SelectDTO.fromJson(json[K.teamKey]),
        contratto: json[K.contractKey] == null
            ? null
            : SelectDTO.fromJson(json[K.contractKey]),
        seniority: json[K.seniorityKey] == null
            ? null
            : SelectDTO.fromJson(json[K.seniorityKey]),
        ral: json[K.ralKey] == null ? null : SelectDTO.fromJson(json[K.ralKey]),
        name: json[K.namePropertyKey] == null
            ? null
            : TitleDTO.fromJson(json[K.namePropertyKey]),
        qualifica: json[K.qualificaKey] == null
            ? null
            : RichTextDTO.fromJson(json[K.qualificaKey]),
        retribuzione: json[K.retribuzioneKey] == null
            ? null
            : RichTextDTO.fromJson(json[K.retribuzioneKey]),
        descrizioneOfferta: json[K.descrizioneOffertaKey] == null
            ? null
            : RichTextDTO.fromJson(json[K.descrizioneOffertaKey]),
        comeCandidarsi: json[K.comeCandidarsiKey] == null
            ? null
            : RichTextDTO.fromJson(json[K.comeCandidarsiKey]),
        localita: json[K.localitaKey] == null
            ? null
            : RichTextDTO.fromJson(json[K.localitaKey]),
        nomeAzienda: json[K.nomeAziendaKey] == null
            ? null
            : RichTextDTO.fromJson(json[K.nomeAziendaKey]),
        statoDiPubblicazione: json[K.statoDiPubblicazioneKey] == null
            ? null
            : RichTextDTO.fromJson(json[K.statoDiPubblicazioneKey]),
        urlSitoWeb: json[K.urlSitoWeb] == null
            ? null
            : UrlDTO.fromJson(json[K.urlSitoWeb]),
        tempistiche: json[K.tempisticeKey] == null
            ? null
            : RichTextDTO.fromJson(json[K.tempisticeKey]),
        richiestaDiLavoro: json[K.richiestaDiLavoroKey] == null
            ? null
            : RichTextDTO.fromJson(json[K.richiestaDiLavoroKey]),
        budget: json[K.budgetKey] == null
            ? null
            : RichTextDTO.fromJson(json[K.budgetKey]),
        nda: json[K.ndaKey] == null ? null : SelectDTO.fromJson(json[K.ndaKey]),
        codice: json[K.codiceKey] == null
            ? null
            : TitleDTO.fromJson(json[K.codiceKey]),
        tempisticheDiPagamento: json[K.tempisticheDiPagamentoKey] == null
            ? null
            : RichTextDTO.fromJson(json[K.tempisticheDiPagamentoKey]),
        descrizioneDelProgetto: json[K.descrizioneDelProgettoKey] == null
            ? null
            : RichTextDTO.fromJson(json[K.descrizioneDelProgettoKey]),
        tipoDiRelazione: json[K.tipoDiRelazioneKey] == null
            ? null
            : SelectDTO.fromJson(json[K.tipoDiRelazioneKey]),
      );

  @override
  List<Object?> get props => [
        jobPosted,
        team,
        contratto,
        seniority,
        ral,
        name,
        qualifica,
        retribuzione,
        descrizioneOfferta,
        comeCandidarsi,
        localita,
        nomeAzienda,
        statoDiPubblicazione,
        urlSitoWeb,
        tempistiche,
        richiestaDiLavoro,
        budget,
        nda,
        codice,
        tempisticheDiPagamento,
        descrizioneDelProgetto,
        tipoDiRelazione,
      ];
}

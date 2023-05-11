import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:job_app/core/data/models/weblink_model.dart';
import 'package:job_app/core/domain/enums/tipologia_annunci.dart';

import '../../../../core/data/models/rich_text_model.dart';
import 'nda_model.dart';
import 'relazione_model.dart';

class AnnuncioFreelancersModel extends Equatable {
  final String id;
  final String titolo; //da 'CODICE' sul json notion
  final bool archived;
  final List<RichTextModel> tempistiche;
  final List<RichTextModel> tempistichePagamento;
  final List<RichTextModel> richiestaDiLavoro;
  final List<RichTextModel> descrizioneProgetto;
  final List<RichTextModel> budget;
  final DateTime jobPosted;
  final WebLinkModel comeCandidarsi;
  final NdaModel? nda;
  final RelazioneModel? relazione;
  final WebLinkModel? urlAnnuncio;
  final String? emoji;
  final TipoAnnuncio tipoAnnuncio;

  const AnnuncioFreelancersModel({
    required this.id,
    required this.titolo,
    required this.archived,
    required this.tempistiche,
    required this.tempistichePagamento,
    required this.richiestaDiLavoro,
    required this.descrizioneProgetto,
    required this.budget,
    required this.jobPosted,
    required this.comeCandidarsi,
    this.nda,
    this.relazione,
    this.urlAnnuncio,
    this.emoji,
    required this.tipoAnnuncio,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'id': id});
    result.addAll({'titolo': titolo});
    if (nda != null) {
      result.addAll({'nda': nda!.toMap()});
    }
    if (relazione != null) {
      result.addAll({'relazione': relazione!.toMap()});
    }
    result
        .addAll({'tempistiche': (tempistiche).map((x) => x.toMap()).toList()});
    result.addAll({
      'tempistichePagamento':
          (tempistichePagamento).map((x) => x.toMap()).toList()
    });
    result.addAll({
      'richiestaDiLavoro': (richiestaDiLavoro).map((x) => x.toMap()).toList()
    });

    result.addAll({
      'descrizioneProgetto':
          (descrizioneProgetto).map((x) => x.toMap()).toList()
    });
    result.addAll({'budget': (budget).map((x) => x.toMap()).toList()});
    result.addAll({'comeCandidarsi': (comeCandidarsi).toMap()});
    if (urlAnnuncio != null) {
      result.addAll({'urlAnnuncio': urlAnnuncio!.toMap()});
    }
    if (emoji != null) {
      result.addAll({'emoji': emoji});
    }
    result.addAll({'jobPosted': jobPosted.millisecondsSinceEpoch});
    result.addAll({'archived': archived});

    result.addAll({'tipoAnnuncio': tipoAnnuncio.name});

    return result;
  }

  factory AnnuncioFreelancersModel.fromJson(Map<String, dynamic> map) {
    return AnnuncioFreelancersModel(
        id: map['id'] ?? '',
        titolo: map['titolo'] ?? '',
        archived: map['archived'] ?? false,
        comeCandidarsi: WebLinkModel.fromJson(map['comeCandidarsi']),
        tempistiche: List<RichTextModel>.from(
            map['tempistiche']?.map((x) => RichTextModel.fromJson(x))),
        tempistichePagamento: List<RichTextModel>.from(
            map['tempistichePagamento']?.map((x) => RichTextModel.fromJson(x))),
        richiestaDiLavoro: List<RichTextModel>.from(
            map['richiestaDiLavoro']?.map((x) => RichTextModel.fromJson(x))),
        descrizioneProgetto: List<RichTextModel>.from(
            map['descrizioneProgetto']?.map((x) => RichTextModel.fromJson(x))),
        budget: List<RichTextModel>.from(
            map['budget']?.map((x) => RichTextModel.fromJson(x))),
        emoji: map['emoji'],
        jobPosted: DateTime.fromMillisecondsSinceEpoch(map['jobPosted']),
        tipoAnnuncio: TipoAnnuncio.values.byName(map['tipoAnnuncio']));
  }
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      titolo,
      archived,
      tempistiche,
      tempistichePagamento,
      richiestaDiLavoro,
      descrizioneProgetto,
      budget,
      jobPosted,
      comeCandidarsi,
      nda,
      relazione,
      urlAnnuncio,
      emoji,
      tipoAnnuncio,
    ];
  }
}

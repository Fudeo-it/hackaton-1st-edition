import 'package:equatable/equatable.dart';

import 'package:job_app/features/freelancers/domain/entities/nda_entity.dart';
import 'package:job_app/features/freelancers/domain/entities/relazione_entity.dart';

import '../../../../core/domain/entities/typedefs.dart';
import '../../../../core/domain/entities/weblink.dart';
import '../../../../core/domain/enums/tipologia_annunci.dart';

class AnnuncioFreelancers extends Equatable {
  final String id;
  final String titolo; //da 'CODICE' sul json notion
  final bool archived;
  final bool preferito;
  final RichTextList tempistiche;
  final RichTextList tempistichePagamento;
  final RichTextList richiestaDiLavoro;
  final RichTextList descrizioneProgetto;
  final RichTextList budget;
  final DateTime jobPosted;
  final WebLink comeCandidarsi;
  final NdaEntity? nda;
  final RelazioneEntity? relazione;
  final WebLink? urlAnnuncio;
  final String? emoji;

  const AnnuncioFreelancers({
    required this.id,
    required this.titolo,
    required this.archived,
    this.preferito = false,
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
  });
  final TipoAnnuncio tipoAnnuncio = TipoAnnuncio.freelancers;

  //TODO fare unico metodo che accetta un richtextlist
  String get plainTempistiche {
    String result = "";
    for (var element in tempistiche) {
      result += element.plainText;
    }
    return result;
  }

  String get plainTempistichePagamento {
    String result = "";
    for (var element in tempistichePagamento) {
      result += element.plainText;
    }
    return result;
  }

  String get plainRichiestaDiLavoro {
    String result = "";
    for (var element in richiestaDiLavoro) {
      result += element.plainText;
    }
    return result;
  }

  String get plainDescrizioneProgetto {
    String result = "";
    for (var element in descrizioneProgetto) {
      result += element.plainText;
    }
    return result;
  }

  String get plainBudget {
    String result = "";
    for (var element in budget) {
      result += element.plainText;
    }
    return result;
  }

  @override
  List<Object?> get props {
    return [
      id,
      titolo,
      archived,
      preferito,
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
    ];
  }

  AnnuncioFreelancers copyWith({
    String? id,
    String? titolo,
    bool? archived,
    bool? preferito,
    RichTextList? tempistiche,
    RichTextList? tempistichePagamento,
    RichTextList? richiestaDiLavoro,
    RichTextList? descrizioneProgetto,
    RichTextList? budget,
    DateTime? jobPosted,
    WebLink? comeCandidarsi,
    NdaEntity? nda,
    RelazioneEntity? relazione,
    WebLink? urlAnnuncio,
    String? emoji,
  }) {
    return AnnuncioFreelancers(
      id: id ?? this.id,
      titolo: titolo ?? this.titolo,
      archived: archived ?? this.archived,
      preferito: preferito ?? this.preferito,
      tempistiche: tempistiche ?? this.tempistiche,
      tempistichePagamento: tempistichePagamento ?? this.tempistichePagamento,
      richiestaDiLavoro: richiestaDiLavoro ?? this.richiestaDiLavoro,
      descrizioneProgetto: descrizioneProgetto ?? this.descrizioneProgetto,
      budget: budget ?? this.budget,
      jobPosted: jobPosted ?? this.jobPosted,
      comeCandidarsi: comeCandidarsi ?? this.comeCandidarsi,
      nda: nda ?? this.nda,
      relazione: relazione ?? this.relazione,
      urlAnnuncio: urlAnnuncio ?? this.urlAnnuncio,
      emoji: emoji ?? this.emoji,
    );
  }
}

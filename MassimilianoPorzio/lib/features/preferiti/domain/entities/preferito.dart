import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:job_app/core/domain/entities/typedefs.dart';
import 'package:job_app/core/domain/enums/tipologia_annunci.dart';
import 'package:job_app/features/aziende/data/mappers/annuncio_azienda_mapper.dart';
import 'package:job_app/features/aziende/data/models/annuncio_azienda_model.dart';

import 'package:job_app/features/aziende/domain/entities/annuncio_azienda.dart';
import 'package:job_app/features/freelancers/data/mappers/annuncio_freelancers_mapper.dart';
import 'package:job_app/features/freelancers/data/models/annuncio_freelancers_model.dart';
import 'package:job_app/features/freelancers/domain/entities/annuncio_freelancer.dart';

import '../../../../core/services/service_locator.dart';

class Preferito extends Equatable with Comparable {
  final AnnuncioAzienda? annuncioAzienda;
  final AnnuncioFreelancers? annuncioFreelancers;

  const Preferito({
    this.annuncioAzienda,
    this.annuncioFreelancers,
  }) : assert(
            (annuncioAzienda != null && annuncioFreelancers == null) ||
                (annuncioAzienda == null && annuncioFreelancers != null),
            "Non puoi usare due annunci o non usarne nessuno");

  RichTextList get tempistiche {
    if (annuncioFreelancers != null) {
      return annuncioFreelancers!.tempistiche;
    } else {
      return [];
    }
  }

  RichTextList get tempistichePagamento {
    if (annuncioFreelancers != null) {
      return annuncioFreelancers!.tempistichePagamento;
    } else {
      return [];
    }
  }

  RichTextList get richiestaDiLavoro {
    if (annuncioFreelancers != null) {
      return annuncioFreelancers!.richiestaDiLavoro;
    } else {
      return [];
    }
  }

  RichTextList get descrizioneProgetto {
    if (annuncioFreelancers != null) {
      return annuncioFreelancers!.descrizioneProgetto;
    } else {
      return [];
    }
  }

  RichTextList get budget {
    if (annuncioFreelancers != null) {
      return annuncioFreelancers!.budget;
    } else {
      return [];
    }
  }

  String get titolo {
    if (annuncioAzienda != null) {
      return annuncioAzienda!.titolo;
    } else {
      return annuncioFreelancers!.titolo;
    }
  }

  RichTextList get descrizioneOfferta {
    if (annuncioAzienda != null) {
      return annuncioAzienda!.descrizioneOfferta;
    } else {
      return [];
    }
  }

  TipoAnnuncio get tipoAnnuncio {
    if (isAzienda) {
      return TipoAnnuncio.aziende;
    } else {
      return TipoAnnuncio.freelancers;
    }
  }

  bool get isAzienda {
    return annuncioAzienda != null;
  }

  bool get preferito {
    if (annuncioFreelancers == null) {
      return annuncioAzienda!.preferito;
    } else {
      return annuncioFreelancers!.preferito;
    }
  }

  String get annuncioId {
    if (annuncioFreelancers == null) {
      return annuncioAzienda!.id;
    } else {
      return annuncioFreelancers!.id;
    }
  }

  DateTime get jobPosted {
    if (annuncioFreelancers == null) {
      return annuncioAzienda!.jobPosted;
    } else {
      return annuncioFreelancers!.jobPosted;
    }
  }

  factory Preferito.fromAnnuncioAzienda(AnnuncioAzienda annuncio) {
    return Preferito(annuncioAzienda: annuncio.copyWith(preferito: true));
  }

  factory Preferito.fromAnnuncioFreelancers(AnnuncioFreelancers annuncio) {
    return Preferito(annuncioFreelancers: annuncio.copyWith(preferito: true));
  }

  @override
  List<Object?> get props => [annuncioAzienda, annuncioFreelancers];

  @override
  int compareTo(other) {
    return jobPosted.compareTo(other.jobPosted);
  }
  //SERIALIZZAZIONE è PER HYDRATED BLOC...la faccio qui per mancanza di tempo
  //come domain non dovrebbe avere nulla a che fare con la serializzazione...

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    if (annuncioAzienda != null) {
      result.addAll({
        'annuncioAzienda':
            sl<AnnuncioAziendaMapper>().fromEntity(annuncioAzienda!).toMap()
      });
    }
    if (annuncioFreelancers != null) {
      result.addAll({
        'annuncioFreelancers': sl<AnnuncioFreelancersMapper>()
            .fromEntity(annuncioFreelancers!)
            .toMap()
      });
    }

    return result;
  }

  factory Preferito.fromJson(Map<String, dynamic> json) {
    return Preferito(
      annuncioAzienda: json['annuncioAzienda'] != null
          ? sl<AnnuncioAziendaMapper>()
              .toEntity(AnnuncioAziendaModel.fromJson(json['annuncioAzienda']))
          : null,
      annuncioFreelancers: json['annuncioFreelancers'] != null
          ? sl<AnnuncioFreelancersMapper>().toEntity(
              AnnuncioFreelancersModel.fromJson(json['annuncioFreelancers']))
          : null,
    );
  }
}

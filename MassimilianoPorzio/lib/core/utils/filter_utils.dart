import 'package:job_app/features/aziende/domain/usecases/annunci_azienda_params.dart';
import 'package:job_app/features/freelancers/domain/usecases/annunci_freelancer_params.dart';

import '../../app/resources/string_constants.dart';

List buildFilterMapFromParamsFreelancers(AnnunciFreelancersParams params) {
  final listaFiltri = [];
  //FILTRI SU tempistiche, tempistichePagamento , richiesta di lavoro,
  // descrizioneProgetto, budget o TITLO
  if (params.searchTerm.isNotEmpty) {
    Map<String, dynamic> searchTermMap = {"or": []};
    Map<String, dynamic> tempisticheMap = {
      "property": StringConsts.notionTempistiche,
      "rich_text": {"contains": params.searchTerm}
    };
    searchTermMap['or'].add(tempisticheMap);
    Map<String, dynamic> tempistichePagamentoMap = {
      "property": StringConsts.notionTempisticheDiPagamento,
      "rich_text": {"contains": params.searchTerm}
    };
    searchTermMap['or'].add(tempistichePagamentoMap);
    Map<String, dynamic> richiestaDiLavoroMap = {
      "property": StringConsts.notionRichiestaDiLavoro,
      "rich_text": {"contains": params.searchTerm}
    };
    searchTermMap['or'].add(richiestaDiLavoroMap);
    Map<String, dynamic> descrizioneProgettoMap = {
      "property": StringConsts.notionDescrizioneProgetto,
      "rich_text": {"contains": params.searchTerm}
    };
    searchTermMap['or'].add(descrizioneProgettoMap);
    Map<String, dynamic> budgetMap = {
      "property": StringConsts.notionBudget,
      "rich_text": {"contains": params.searchTerm}
    };
    searchTermMap['or'].add(budgetMap);
    Map<String, dynamic> titoloMap = {
      "property": "title",
      "rich_text": {"contains": params.searchTerm}
    };
    searchTermMap['or'].add(titoloMap);
    listaFiltri.add(searchTermMap);
  }
  //== FINE FILTRI SU RICH TEXT FIELDS o TITOLO ANNUNCIO
  //=== FILTRI SU NDA e RELAZIONE
  if (!params.isNdaEmpty) {
    Map<String, dynamic> ndaMap = {"or": []}; //inizio con OR
    //poi se c'è un solo filtro nda sovrascrivo on unico filtro
    if (params.noNdaFilter) {
      Map<String, dynamic> noMap = {
        "and": [
          {
            "property": StringConsts.notionNda,
            "select": {"equals": StringConsts.notionNdaSi}
          },
          {
            "property": StringConsts.notionNda,
            "select": {"is_not_empty": true}
          }
        ],
      };
      if (params.numberOfNdaFilters > 1) {
        ndaMap['or'].add(noMap);
      } else {
        ndaMap = noMap; //UNICO FILTRO
      }
    }
    if (params.siNdaFilter) {
      Map<String, dynamic> siMap = {
        "and": [
          {
            "property": StringConsts.notionNda,
            "select": {"equals": StringConsts.notionNdaNo}
          },
          {
            "property": StringConsts.notionNda,
            "select": {"is_not_empty": true}
          }
        ],
      };
      if (params.numberOfNdaFilters > 1) {
        ndaMap['or'].add(siMap);
      } else {
        ndaMap = siMap; //UNICO FILTRO
      }
      listaFiltri.add(ndaMap);
    }
  } //c'erano filtri NDA
  if (!params.isRelazioneEmpty) {
    Map<String, dynamic> relazioneMap = {"or": []}; //inizio con OR
    //poi se c'è un solo filtro nda sovrascrivo on unico filtro
    if (params.soloRelazioneFilter) {
      Map<String, dynamic> soloMap = {
        "and": [
          {
            "property": StringConsts.notionRelazione,
            "select": {"equals": StringConsts.notionRelazioneSolo}
          },
          {
            "property": StringConsts.notionRelazione,
            "select": {"is_not_empty": true}
          }
        ],
      };
      if (params.numberOfRelazioneFilters > 1) {
        relazioneMap['or'].add(soloMap);
      } else {
        relazioneMap = soloMap; //UNICO FILTRO
      }
    }
    if (params.altriRelazioneFilter) {
      Map<String, dynamic> altriMap = {
        "and": [
          {
            "property": StringConsts.notionRelazione,
            "select": {"equals": StringConsts.notioNRelazioneAltri}
          },
          {
            "property": StringConsts.notionRelazione,
            "select": {"is_not_empty": true}
          }
        ],
      };
      if (params.numberOfRelazioneFilters > 1) {
        relazioneMap['or'].add(altriMap);
      } else {
        relazioneMap = altriMap; //UNICO FILTRO
      }
    }
    listaFiltri.add(relazioneMap);
  } //c'erano filtri RELAZIONE

  return listaFiltri;
}

List buildFilterMapFromParamsAz(AnnunciAzParams params) {
  final listaFiltri = [];
  //FILTRI SU DESCRIZIONE OFFERTA OR TITOLO ANNUNCIO
  if (params.searchTerm.isNotEmpty) {
    Map<String, dynamic> searchTermMap = {"or": []};
    Map<String, dynamic> descrizioneOffertaMap = {
      "property": "Descrizione offerta",
      "rich_text": {"contains": params.searchTerm}
    };

    searchTermMap['or']
        .add(descrizioneOffertaMap); //FILTRA NELLA DESCRIZIONE OFFERTA
    Map<String, dynamic> titoloMap = {
      "property": "title",
      "rich_text": {"contains": params.searchTerm}
    };
    searchTermMap['or'].add(titoloMap);
    listaFiltri.add(searchTermMap);
  }
  //==== FINE FILTRI SU DESCR OFFERTA O TITOLO ANNUNCIO

  //==== FILTRI SU SENIORITY:
  if (!params.isSeniorityEmpty) {
    Map<String, dynamic> seniorityMap = {};
    if (params.numberOfSeniorityFilters > 1) {
      seniorityMap['or'] = [];
    }
    if (params.juniorSeniorityFilter) {
      Map<String, dynamic> juniorMap = {
        "and": [
          {
            "property": StringConsts.notionSeniority,
            "select": {"equals": StringConsts.notionSeniorityJunior}
          },
          {
            "property": StringConsts.notionSeniority,
            "select": {"is_not_empty": true}
          }
        ],
      };
      if (params.numberOfSeniorityFilters > 1) {
        seniorityMap['or'].add(juniorMap);
      } else {
        seniorityMap = juniorMap; //UNICA SENIORITY
      }
    }
    if (params.midSeniorityFilter) {
      Map<String, dynamic> midMap = {
        "and": [
          {
            "property": StringConsts.notionSeniority,
            "select": {"equals": StringConsts.notionSeniorityMid}
          },
          {
            "property": StringConsts.notionSeniority,
            "select": {"is_not_empty": true}
          }
        ],
      };
      if (params.numberOfSeniorityFilters > 1) {
        seniorityMap['or'].add(midMap);
      } else {
        seniorityMap = midMap; //UNICA SENIORITY
      }
    }
    if (params.seniorSeniorityFilter) {
      Map<String, dynamic> seniorMap = {
        "and": [
          {
            "property": StringConsts.notionSeniority,
            "select": {"equals": StringConsts.notionSenioritySenior}
          },
          {
            "property": StringConsts.notionSeniority,
            "select": {"is_not_empty": true}
          }
        ],
      };
      if (params.numberOfSeniorityFilters > 1) {
        seniorityMap['or'].add(seniorMap);
      } else {
        seniorityMap = seniorMap; //UNICA SENIORITY
      }
    }
    listaFiltri.add(seniorityMap);
  }

  //==== FINE FILTRI SU SENIORTY
  //==== FILTRI SU CONTRATTO:
  if (!params.isContrattoEmpty) {
    Map<String, dynamic> contrattoMap = {"or": []};
    if (params.partTimeFilter) {
      Map<String, dynamic> partTimeMap = {
        "and": [
          {
            "property": StringConsts.notionContratto,
            "select": {"equals": StringConsts.notionContrattoPartTime}
          },
          {
            "property": StringConsts.notionContratto,
            "select": {"is_not_empty": true}
          }
        ],
      };
      if (params.numberOfContrattoFilters > 1) {
        contrattoMap['or'].add(partTimeMap);
      } else {
        contrattoMap = partTimeMap; //UNICO FILTRO
      }
    }
    if (params.fullTimeFilter) {
      Map<String, dynamic> fullTimeMap = {
        "and": [
          {
            "property": StringConsts.notionContratto,
            "select": {"equals": StringConsts.notionContrattoFullTime}
          },
          {
            "property": StringConsts.notionContratto,
            "select": {"is_not_empty": true}
          }
        ],
      };
      if (params.numberOfContrattoFilters > 1) {
        contrattoMap['or'].add(fullTimeMap);
      } else {
        contrattoMap = fullTimeMap; //UNICO FILTRO
      }
    }
    listaFiltri.add(contrattoMap);
  }

  //==== FINE FILTRI SU CONTRATTO

  //==== FILTRI SU TEAM:
  if (!params.isTeamEmpty) {
    Map<String, dynamic> teamMap = {"or": []};
    if (params.inSedeFilter) {
      Map<String, dynamic> inSedeMap = {
        "and": [
          {
            "property": StringConsts.notionTeam,
            "select": {"equals": StringConsts.notionTeamInSede}
          },
          {
            "property": StringConsts.notionTeam,
            "select": {"is_not_empty": true}
          }
        ],
      };
      if (params.numberOfTeamFilters > 1) {
        teamMap['or'].add(inSedeMap);
      } else {
        teamMap = inSedeMap; //UNICO FILTRO
      }
    }
    if (params.ibridoFilter) {
      Map<String, dynamic> ibridoMap = {
        "and": [
          {
            "property": StringConsts.notionTeam,
            "select": {"equals": StringConsts.notionTeamIbrido}
          },
          {
            "property": StringConsts.notionTeam,
            "select": {"is_not_empty": true}
          }
        ],
      };
      if (params.numberOfTeamFilters > 1) {
        teamMap['or'].add(ibridoMap);
      } else {
        teamMap = ibridoMap; //UNICO FILTRO
      }
    }
    if (params.fullRemoteFilter) {
      Map<String, dynamic> fullremoteMap = {
        "and": [
          {
            "property": StringConsts.notionTeam,
            "select": {"equals": StringConsts.notionTeamFullRemote}
          },
          {
            "property": StringConsts.notionTeam,
            "select": {"is_not_empty": true}
          }
        ],
      };
      if (params.numberOfTeamFilters > 1) {
        teamMap['or'].add(fullremoteMap);
      } else {
        teamMap = fullremoteMap; //UNICO FILTRO
      }
    }
    listaFiltri.add(teamMap);
  }

  //==== FINE FILTRI SU TEAM
  return listaFiltri;
}

import 'dart:async';
import 'package:annunci_lavoro_flutter/extension/first_where_or_null.dart';
import 'package:annunci_lavoro_flutter/misc/sort.dart';
import 'package:annunci_lavoro_flutter/models/job_positions_model.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class JobAdsController {
  ///
  /// classe che riceve in input una lista di [JobPosition] e controlla il flusso di dati tramite uno stream [_listController].
  /// la gestione dei filtri è affidata a delle liste che contengono i filtri in base al tipo.
  /// [seniorityFilters] [contractFilter] [teamFilters]
  ///
  /// la gestione dell'ordinamento è affidata a una lista che contien i criteri di ricerca [sorting]
  ///
  /// gestisce gli annunci preferiti tramite la lista [favouriteList]
  ///
  /// e lo stream che la controlla [_favouriteListController]
  ///
  /// gestisce la ricerca tramite un listener su un [TextEditingController] [searchController]
  ///
  /// utilizza anche dei [ValueNotifier] per notificare la presenza di elementi nelle liste senza aggiornare l'intero flusso delle liste.
  /// [isSortingEmpty][sContractFiltersEmpty][isSeniorityFiltersEmpty][isTeamFiltersEmpty]
  ///
  final BehaviorSubject<List<JobPosition>> _listController =
      BehaviorSubject<List<JobPosition>>.seeded([]);

  final BehaviorSubject<List<JobPosition>> _favouriteListController =
      BehaviorSubject<List<JobPosition>>.seeded([]);

  List<JobPosition> adsList;
  List<Team> teamFilters;
  List<Seniority> seniorityFilters;
  List<ContractType> contractFilters;
  List<JobSort> sorting;
  TextEditingController searchController;
  late List<JobPosition> favouriteList;
  late ValueNotifier<bool> isSortingEmpty;
  late ValueNotifier<bool> isContractFiltersEmpty;
  late ValueNotifier<bool> isSeniorityFiltersEmpty;
  late ValueNotifier<bool> isTeamFiltersEmpty;

  JobAdsController(this.adsList)
      : searchController = TextEditingController(),
        teamFilters = [],
        seniorityFilters = [],
        contractFilters = [],
        sorting = [] {
    isSortingEmpty = ValueNotifier(sorting.isEmpty);
    isContractFiltersEmpty = ValueNotifier(contractFilters.isEmpty);
    isSeniorityFiltersEmpty = ValueNotifier(seniorityFilters.isEmpty);
    isTeamFiltersEmpty = ValueNotifier(seniorityFilters.isEmpty);
    favouriteList = adsList.where((ads) => ads.isFavourite).toList();

    searchController.addListener(
      () {
        searchResults();
      },
    );
  }

  /// metodo richiamato quando l'utente chiude il textfield della ricerca.
  void stopSearch() {
    _listController.add(adsList);
    applyFilters();
    if (sorting.isNotEmpty) {
      applySorting();
    }
  }

  /// metodo che aggiunge un annuncio ai preferiti.
  void addToFavorite(String id) {
    final selectedAd =
        _listController.value.firstWhere((ad) => ad.metaData.id == id);
    favouriteList.add(selectedAd);
    _favouriteListController.add(favouriteList);
    if (searchController.text.isEmpty) {
      applyFilters();
      if (searchController.text.isNotEmpty) {
        applyFilters();
        if (sorting.isNotEmpty) {
          applySorting();
        }
      }
    }
  }

  /// metodo che rimuove un annuncio  dai preferiti.
  void removeFromFavorite(String id) {
    //* controllo se l'oggetto è già in memoria quindi nella lista principale
    JobPosition? selectedAd = _listController.value.firstWhereOrNull(
      (ad) => ad.metaData.id == id,
    );
    //* altrimenti lo cerco nella lista dei favoriti e poi lo elimino.
    if (selectedAd == null) {
      selectedAd = _favouriteListController.value.firstWhere(
        (ad) => ad.metaData.id == id,
      );
      favouriteList.remove(selectedAd);
      _favouriteListController.add(favouriteList);
    } else {
      favouriteList.remove(selectedAd);
      _favouriteListController.add(favouriteList);
    }
    if (searchController.text.isEmpty) {
      applyFilters();
      if (sorting.isNotEmpty) {
        applySorting();
      }
    }
  }

  /// metodo per aggiornare la lista dei favoriti con gli eventuali annunci restituiti
  /// dal repository , che non sono ancora presenti in memoria.
  void updateFovorites(List<JobPosition> newList) {
    favouriteList = newList;
    _favouriteListController.add(favouriteList);
  }

  /// metodo che aggiorna la lista in tempo reale mentre l'utente digita nel textField.

  void searchResults() {
    List<JobPosition> searchingResults = adsList.where((jobPosition) {
      return jobPosition.adsTitle
              .contains(searchController.text.toLowerCase()) ||
          jobPosition.company
              .toLowerCase()
              .contains(searchController.text.toLowerCase()) ||
          jobPosition.workLocation!
              .toLowerCase()
              .contains(searchController.text.toLowerCase()) ||
          jobPosition.adsDescription.descriptionText
              .toLowerCase()
              .contains(searchController.text.toLowerCase());
    }).toList();
    _listController.add(searchingResults);
  }

  /// metodo che aggiunge annunci [JobPosition] alla lista.
  void addItems(List<JobPosition> ads) {
    adsList.addAll(ads);
    applyFilters();
    if (sorting.isNotEmpty) {
      applySorting();
    }
  }

  /// metodo che aggiunge un filtro di tipo [Team]
  void addTeamFilter(Team filter) {
    teamFilters.add(filter);
    isTeamFiltersEmpty.value = teamFilters.isEmpty;
    applyFilters();
  }

  /// metodo che rimuove un filtro di tipo [Team]
  void removeTeamFilter(Team filter) {
    teamFilters.remove(filter);
    isTeamFiltersEmpty.value = teamFilters.isEmpty;
    applyFilters();
  }

  /// metodo che aggiunge un filtro di tipo [Seniority]
  void addSeniorityFilter(Seniority filter) {
    seniorityFilters.add(filter);
    isSeniorityFiltersEmpty.value = seniorityFilters.isEmpty;
    applyFilters();
  }

  /// metodo che rimuove un filtro di tipo [Seniority]
  void removeSeniorityFilter(Seniority filter) {
    seniorityFilters.remove(filter);
    isSeniorityFiltersEmpty.value = seniorityFilters.isEmpty;
    applyFilters();
  }

  /// metodo che aggiunge un filtro di tipo [ContractType]
  void addContractFilter(ContractType filter) {
    contractFilters.add(filter);
    isContractFiltersEmpty.value = contractFilters.isEmpty;
    applyFilters();
  }

  /// metodo che rimuove un filtro di tipo [ContractType]
  void removeContractFilter(ContractType filter) {
    contractFilters.remove(filter);
    isContractFiltersEmpty.value = contractFilters.isEmpty;
    applyFilters();
  }

  /// metodo che resetta tutti i filtri svuotando le rispettive liste.
  void resetFilter() {
    contractFilters.clear();
    teamFilters.clear();
    seniorityFilters.clear();
    isContractFiltersEmpty.value = contractFilters.isEmpty;
    isSeniorityFiltersEmpty.value = seniorityFilters.isEmpty;
    isTeamFiltersEmpty.value = seniorityFilters.isEmpty;
    applyFilters();
  }

  /// metodo che aggiunge un criterio di ordinamento di tipo [JobSort]
  void addSort(JobSort sort) {
    sorting.add(sort);
    isSortingEmpty.value = sorting.isEmpty;
    applySorting();
  }

  /// metodo che rimuove un criterio di ordinamento di tipo [JobSort]
  void removeSort(JobSort sort) {
    sorting.remove(sort);
    isSortingEmpty.value = sorting.isEmpty;
    applySorting();
  }

  /// metodo che resette i criteri di ordinamento svuotando la lista [sorting]
  void resetSort() {
    sorting.clear();
    isSortingEmpty.value = sorting.isEmpty;
    adsList.sort((a, b) => b.postedDate.compareTo(a.postedDate));
    _listController.add(adsList);
  }

  /// metodo che applica i ifltri.
  void applyFilters() {
    final filteredList = adsList.where(
      (jobPosition) {
        bool matchesTeamFilter = teamFilters.isEmpty ||
            teamFilters.contains(jobPosition.jobLocation);
        bool matchesSeniorityFilter = seniorityFilters.isEmpty ||
            seniorityFilters.contains(jobPosition.seniority);
        bool matchesContractFilter = contractFilters.isEmpty ||
            contractFilters.contains(jobPosition.contractType);
        return matchesTeamFilter &&
            matchesSeniorityFilter &&
            matchesContractFilter;
      },
    ).toList();
    _listController.add(filteredList);
  }

  /// metodo che applica i criteri di ordinamento.
  void applySorting() {
    if (sorting.isEmpty) {
      adsList.sort((a, b) => b.postedDate.compareTo(a.postedDate));
    }
    sorting.forEach(
      (sort) {
        adsList.sort(
          (a, b) {
            final attributeA = sort.attributeGetter(a);
            final attributeB = sort.attributeGetter(b);
            return sort.ascending
                ? attributeA.compareTo(attributeB)
                : attributeB.compareTo(attributeA);
          },
        );
      },
    );

    _listController.add(adsList);
    applyFilters();
  }

  /// getter che restituisce lo [stream] di [_listController]
  Stream<List<JobPosition>> get stream => _listController.stream;

  /// getter che restituisce lo [stream] di [_favouriteListController]
  Stream<List<JobPosition>> get favstream => _favouriteListController.stream;

  void dispose() {
    _listController.close();
  }
}

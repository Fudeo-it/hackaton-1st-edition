import 'package:annunci_lavoro_flutter/extension/first_where_or_null.dart';
import 'package:annunci_lavoro_flutter/models/freelance_positions_model.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class FreeLanceAdsController {
  ///
  /// classe che riceve in input una lista di [FreeLancePosition] e controlla il flusso di dati tramite uno stream [_listController].
  /// la gestione dei filtri è affidata a delle liste che contengono i filtri in base al tipo.
  /// [ndaFilters] [relationshipFilter]
  ///
  /// gestisce gli annunci preferiti tramite la lista [favouriteList]
  ///
  /// e lo stream che la controlla [_favouriteListController]
  ///
  /// gestisce la ricerca tramite un listener su un [TextEditingController] [searchController]
  ///
  /// utilizza anche dei [ValueNotifier] per notificare la presenza di elementi nelle liste senza aggiornare l'intero flusso delle liste.
  /// [isNdafiltersEmpty][isRelationshipFiltersEmpty]
  ///
  final BehaviorSubject<List<FreeLancePosition>> _listController =
      BehaviorSubject<List<FreeLancePosition>>.seeded([]);

  final BehaviorSubject<List<FreeLancePosition>> _favouriteListController =
      BehaviorSubject<List<FreeLancePosition>>.seeded([]);

  List<FreeLancePosition> adsList;
  List<NDA> ndaFilters;
  List<Relationship> relationshipFilter;
  TextEditingController searchController;
  late List<FreeLancePosition> favouriteList;
  late ValueNotifier<bool> isNdafiltersEmpty;
  late ValueNotifier<bool> isRelationshipFiltersEmpty;
  FreeLanceAdsController(this.adsList)
      : searchController = TextEditingController(),
        ndaFilters = [],
        relationshipFilter = [] {
    isNdafiltersEmpty = ValueNotifier(ndaFilters.isEmpty);
    isRelationshipFiltersEmpty = ValueNotifier(relationshipFilter.isEmpty);
    favouriteList = adsList.where((ads) => ads.isFavourite).toList();
    searchController.addListener(
      () {
        if (searchController.text.isNotEmpty) {
          searchResults();
        }
      },
    );
  }

  /// metodo che aggiunge un annuncio ai preferiti.
  void addToFavorite(String id) {
    final selectedAd =
        _listController.value.firstWhere((ad) => ad.metaData.id == id);
    favouriteList.add(selectedAd);
    _favouriteListController.add(favouriteList);
    selectedAd.isFavourite = true;
    if (searchController.text.isEmpty) {
      applyFilters();
    }
  }

  /// metodo che rimuove un annuncio  dai preferiti.
  void removeFromFavorite(String id) {
//* controllo se l'oggetto è già in memoria quindi nella lista principale
    FreeLancePosition? selectedAd = _listController.value.firstWhereOrNull(
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
    }
  }

  /// metodo per aggiornare la lista dei favoriti con gli eventuali annunci restituiti
  /// dal repository , che non sono ancora presenti in memoria.
  void updateFovorites(List<FreeLancePosition> newList) {
    favouriteList = newList;
    _favouriteListController.add(favouriteList);
  }

  /// metodo richiamato quando l'utente chiude il textfield della ricerca.
  void stopSearch() {
    _listController.add(adsList);
    applyFilters();
  }

  /// metodo che aggiorna la lista in tempo reale mentre l'utente digita nel textField.
  void searchResults() {
    List<FreeLancePosition> searchingResults =
        adsList.where((freelanceposition) {
      return freelanceposition.adsTitle
              .toLowerCase()
              .contains(searchController.text.toLowerCase()) ||
          freelanceposition.jobRequest.descriptionText
              .toLowerCase()
              .contains(searchController.text.toLowerCase()) ||
          freelanceposition.budget.descriptionText
              .toLowerCase()
              .contains(searchController.text.toLowerCase()) ||
          freelanceposition.workTiming.descriptionText
              .toLowerCase()
              .contains(searchController.text.toLowerCase()) ||
          freelanceposition.adsDescription.descriptionText
              .toLowerCase()
              .contains(searchController.text.toLowerCase());
    }).toList();
    _listController.add(searchingResults);
  }

  /// metodo che aggiunge annunci [FreeLancePosition] alla lista.
  void addItems(List<FreeLancePosition> ads) {
    adsList.addAll(ads);
    applyFilters();
  }

  /// metodo che aggiunge un filtro di tipo [NDA]
  void addNdaFilter(NDA filter) {
    ndaFilters.add(filter);
    isNdafiltersEmpty.value = ndaFilters.isEmpty;
    applyFilters();
  }

  /// metodo che rimuove un filtro di tipo [NDA]
  void removeNdaFilter(NDA filter) {
    ndaFilters.remove(filter);
    isNdafiltersEmpty.value = ndaFilters.isEmpty;
    applyFilters();
  }

  /// metodo che aggiunge un filtro di tipo [Relationship]
  void addRelationshipFilter(Relationship filter) {
    relationshipFilter.add(filter);
    isRelationshipFiltersEmpty.value = relationshipFilter.isEmpty;
    applyFilters();
  }

  /// metodo che rimuove un filtro di tipo [Relationship]
  void removeRelationshipFilter(Relationship filter) {
    relationshipFilter.remove(filter);
    isRelationshipFiltersEmpty.value = relationshipFilter.isEmpty;
    applyFilters();
  }

  /// metodo che applica i ifltri
  void applyFilters() {
    final filteredList = adsList.where(
      (jobPosition) {
        bool ndaFilter =
            ndaFilters.isEmpty || ndaFilters.contains(jobPosition.nda);
        bool relationshipfilter = relationshipFilter.isEmpty ||
            relationshipFilter.contains(jobPosition.realtionship);

        return ndaFilter && relationshipfilter;
      },
    ).toList();
    _listController.add(filteredList);
  }

  /// metodo che resetta tutti i filtri svuotando le rispettive liste.
  void resetFilter() {
    ndaFilters.clear();
    relationshipFilter.clear();
    isNdafiltersEmpty.value = ndaFilters.isEmpty;
    isRelationshipFiltersEmpty.value = relationshipFilter.isEmpty;
    applyFilters();
  }

  /// getter che restituisce lo [stream] di [_listController]
  Stream<List<FreeLancePosition>> get stream => _listController.stream;

  /// getter che restituisce lo [stream] di [_favouriteListController]
  Stream<List<FreeLancePosition>> get favstream =>
      _favouriteListController.stream;

  void dispose() {
    _listController.close();
  }
}

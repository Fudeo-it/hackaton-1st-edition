import 'package:job_app/core/domain/entities/typedefs.dart';
import 'package:job_app/core/log/datasource_logger.dart';
import 'dart:async';

import 'package:job_app/features/preferiti/data/datasources/preferiti_datasource.dart';
import 'package:job_app/features/preferiti/domain/entities/preferito.dart';

class PreferitiLocalDatasource
    with DatasourceLoggy
    implements PreferitiDataSource {
  //!mi viene aggiornata (sovrascritta) ogni volta che faccio
  //! fromJSON con HydratedBloc
  ListaPreferiti listaPreferiti = [];

  @override
  FutureOr<void> aggiornaPreferito(Preferito preferito) {
    int indexToUpdate = listaPreferiti
        .indexWhere((element) => element.annuncioId == preferito.annuncioId);
    if (indexToUpdate != -1) {
      listaPreferiti[indexToUpdate] = preferito;
    }
  }

  @override
  FutureOr<void> aggiungiPreferito(Preferito preferito) {
    if (listaPreferiti.indexWhere(
            (element) => element.annuncioId == preferito.annuncioId) ==
        -1) {
      listaPreferiti.add(preferito);
      //aggiungo se non già presente
    }
  }

  @override
  Future<ListaPreferiti> fetchListaPreferiti() async {
    loggy.debug("LA LISTA PREFERIT è lunga: ${listaPreferiti.length}");
    return listaPreferiti;
  }

  @override
  FutureOr<void> rimuoviPreferito(String annuncioId) {
    int indexToDelete = listaPreferiti
        .indexWhere((element) => element.annuncioId == annuncioId);
    listaPreferiti.removeAt(indexToDelete);
  }
}

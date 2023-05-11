import 'dart:async';

import 'package:job_app/core/domain/entities/typedefs.dart';
import 'package:job_app/features/preferiti/domain/entities/preferito.dart';

abstract class PreferitiDataSource {
  Future<ListaPreferiti> fetchListaPreferiti();
  FutureOr<void> aggiungiPreferito(Preferito preferito);
  FutureOr<void> rimuoviPreferito(String annuncioId);
  FutureOr<void> aggiornaPreferito(Preferito preferito);
}

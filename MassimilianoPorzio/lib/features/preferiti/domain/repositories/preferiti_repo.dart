import 'package:dartz/dartz.dart';

import 'package:job_app/core/domain/entities/typedefs.dart';
import 'package:job_app/core/domain/enums/tipologia_annunci.dart';
import 'package:job_app/core/domain/errors/failures.dart';
import 'package:job_app/features/preferiti/domain/entities/preferito.dart';
import 'package:job_app/features/preferiti/domain/usecases/preferiti_filter_params.dart';
import 'package:job_app/features/preferiti/domain/usecases/preferiti_params.dart';

abstract class PreferitiRepository {
  //recupera info aggiornate da notion
  Future<Either<Failure, Preferito>> fetchPreferito({
    required String annuncioId,
    required TipoAnnuncio tipoAnnuncio,
  });

  Future<Either<Failure, ListaPreferiti>> fetchListaPreferiti(
      PreferitiFiltersParams params);
  Future<Either<Failure, Unit>> aggiungiPreferito(PreferitiParams params);
  Future<Either<Failure, Unit>> aggiornaPreferito(PreferitiParams params);
  Future<Either<Failure, Unit>> rimuoviPreferito(PreferitiParams params);
}

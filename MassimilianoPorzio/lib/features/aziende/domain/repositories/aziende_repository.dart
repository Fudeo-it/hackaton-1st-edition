import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/typedefs.dart';
import '../../../../core/domain/errors/failures.dart';
import '../entities/annuncio_azienda.dart';
import '../usecases/annunci_azienda_params.dart';

abstract class AziendeRepository {
  // Future<Either<Failure, AnnuncioAziendaList>> fetchAnnunciAziende(
  //     AnnunciAzParams params);
  Future<Either<Failure, AnnuncioAziendaList>> loadAnnunciAziende(
      AnnunciAzParams params);
  Future<Either<Failure, AnnuncioAziendaList>> refreshAnnunciAziende(
      AnnunciAzParams params);
  Future<Either<Failure, AnnuncioAzienda>> fetchAnnuncio(
      AnnunciAzParams params);
}

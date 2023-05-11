import 'package:job_app/core/domain/errors/failures.dart';
import 'package:job_app/core/domain/entities/typedefs.dart';
import 'package:dartz/dartz.dart';
import 'package:job_app/core/log/repository_logger.dart';
import 'package:job_app/core/services/service_locator.dart';
import 'package:job_app/features/freelancers/data/datasources/freelancers_datasource.dart';
import 'package:job_app/features/freelancers/domain/entities/annuncio_freelancer.dart';
import 'package:job_app/features/freelancers/domain/repositories/freelancers_repo.dart';
import 'package:job_app/features/freelancers/domain/usecases/annunci_freelancer_params.dart';

import '../../../../core/domain/errors/exceptions.dart';
import '../mappers/annuncio_freelancers_mapper.dart';
import '../models/notion_response_dto_freelancers.dart';

class FreelancersRepositoryImpl
    with RepositoryLoggy
    implements FreelancersRepository {
  final FreelancersDatasource remoteDS;
  bool hasMore;
  String nextCursor;
  bool hasMoreNoFilter; //tengono traccia della lista non filtrata
  String nextCursorNoFilter;

  FreelancersRepositoryImpl(
      {required this.remoteDS,
      this.hasMore = true,
      this.hasMoreNoFilter = true,
      this.nextCursor = "",
      this.nextCursorNoFilter = ""});

  @override
  Future<Either<Failure, AnnuncioFreelancers>> fetchAnnuncioFreelancers(
      AnnunciFreelancersParams params) async {
    try {
      if (params.annuncioId != null) {
        loggy.debug("REPO: recupero l'annuncio con id: ${params.annuncioId}");
        NotionResponseFreelancersDTO notionResponse =
            await remoteDS.fetchAnnuncioFreelancers(params.annuncioId!);

        if (notionResponse.listaAnnunci.isEmpty) {
          throw NoAnnuncioException();
        } else {
          var annuncioModel = notionResponse.listaAnnunci.first;
          return Right(sl<AnnuncioFreelancersMapper>().toEntity(annuncioModel));
        }
      } else {
        throw UnimplementedError();
      }
    } on NoAnnuncioException {
      return Left(NoAnnuncioFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } on RestApiException {
      return Left(ServerFailure());
    } on Exception {
      return Left(GenericFailure());
    }
  }

  @override
  Future<Either<Failure, AnnuncioFreelancerList>> loadAnnunciFreelancers(
      AnnunciFreelancersParams params) async {
    loggy.debug("REPO: recupero LA PRIMA pagina degli annunci");
    try {
      NotionResponseFreelancersDTO notionResponse =
          await remoteDS.fetchPrimaPaginaAnnunciFreelancers(params);
      //USO LA RISPOSTA PER AGGIORNARE STARTCURSOR e HASNEXT
      loggy.debug("notionResponse is: $notionResponse");
      if (notionResponse.hasMore) {
        nextCursor = notionResponse.nextCursor!;
        hasMore = true;
      } else {
        nextCursor = "";
        hasMore = false;
      }
      if (params.isEmpty) {
        hasMoreNoFilter = hasMore;
        nextCursorNoFilter = nextCursor;
      }
      return Right(notionResponse.listaAnnunci.annuncioList);
    } on NetworkException {
      return Left(NetworkFailure());
    } on RestApiException {
      return Left(ServerFailure());
    } on Exception {
      return Left(GenericFailure());
    }
  }

  @override
  Future<Either<Failure, AnnuncioFreelancerList>> refreshAnnunciFreelancers(
      AnnunciFreelancersParams params) async {
    loggy.debug("REPO: recupero la SUCCESSIVA pagina degli annunci");
    //*QUI SALVO il cursore e se ha ancora annunci la lista NON filtrata
    try {
      late NotionResponseFreelancersDTO notionResponse;
      if (hasMore) {
        notionResponse = await remoteDS.fetchProssimaPaginaAnnunciFreelancers(
            nextCursor, params); //CON PAGINAZIONE
        //USO LA RISPOSTA PER AGGIORNARE STARTCURSOR e HASNEXT
        loggy.debug("notionResponse is: $notionResponse");
        if (notionResponse.hasMore) {
          nextCursor = notionResponse.nextCursor!;
          hasMore = true;
        } else {
          nextCursor = "";
          hasMore = false;
        }
        if (params.isEmpty) {
          hasMoreNoFilter = hasMore;
          nextCursorNoFilter = nextCursor;
        }
      } else {
        notionResponse = NotionResponseFreelancersDTO.empty();
      }
      return Right(notionResponse.listaAnnunci.annuncioList);
    } on NetworkException {
      return Left(NetworkFailure());
    } on RestApiException {
      return Left(ServerFailure());
    } on Exception {
      return Left(GenericFailure());
    }
  }
}

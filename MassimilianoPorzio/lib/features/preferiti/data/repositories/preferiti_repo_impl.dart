import 'package:dartz/dartz.dart';
import 'package:job_app/core/domain/entities/typedefs.dart';

import 'package:job_app/core/domain/enums/tipologia_annunci.dart';
import 'package:job_app/core/domain/errors/failures.dart';
import 'package:job_app/core/domain/usecases/base_usecase.dart';
import 'package:job_app/core/log/repository_logger.dart';
import 'package:job_app/features/aziende/data/datasources/aziende_datasource.dart';
import 'package:job_app/features/aziende/data/mappers/annuncio_azienda_mapper.dart';
import 'package:job_app/features/aziende/data/models/notion_response_azienda.dart';
import 'package:job_app/features/freelancers/data/datasources/freelancers_datasource.dart';
import 'package:job_app/features/freelancers/data/models/notion_response_dto_freelancers.dart';
import 'package:job_app/features/preferiti/data/datasources/preferiti_datasource.dart';
import 'package:job_app/features/preferiti/domain/entities/preferito.dart';
import 'package:job_app/features/preferiti/domain/repositories/preferiti_repo.dart';
import 'package:job_app/features/preferiti/domain/usecases/preferiti_filter_params.dart';

import '../../../../core/domain/errors/exceptions.dart';
import '../../../../core/services/service_locator.dart';
import '../../../freelancers/data/mappers/annuncio_freelancers_mapper.dart';
import '../../domain/usecases/preferiti_params.dart';

class PreferitiRepositoryImpl
    with RepositoryLoggy
    implements PreferitiRepository {
  final AziendeDatasource datasourceAziende;
  final FreelancersDatasource datasourceFreelancers;
  final PreferitiDataSource preferitiDataSource;

  PreferitiRepositoryImpl({
    required this.preferitiDataSource,
    required this.datasourceAziende,
    required this.datasourceFreelancers,
  });

  @override
  Future<Either<Failure, Preferito>> fetchPreferito(
      {required String annuncioId, required TipoAnnuncio tipoAnnuncio}) async {
    loggy.debug("REPO: recupero il preferito con id: $annuncioId");
    NotionResponseAziendaDTO notionResponseAziendaDTO =
        NotionResponseAziendaDTO.empty();
    NotionResponseFreelancersDTO notionResponseFreelancersDTO =
        NotionResponseFreelancersDTO.empty();
    try {
      if (tipoAnnuncio == TipoAnnuncio.aziende) {
        notionResponseAziendaDTO =
            await datasourceAziende.fetchAnnuncio(annuncioId);
        var annuncioModel = notionResponseAziendaDTO.listaAnnunci.first;
        var annuncio = sl<AnnuncioAziendaMapper>().toEntity(annuncioModel);
        final Preferito preferito = Preferito(annuncioAzienda: annuncio);
        return Right(preferito);
      } else {
        notionResponseFreelancersDTO =
            await datasourceFreelancers.fetchAnnuncioFreelancers(annuncioId);
        var annuncioModel = notionResponseFreelancersDTO.listaAnnunci.first;
        var annuncio = sl<AnnuncioFreelancersMapper>().toEntity(annuncioModel);
        final Preferito preferito = Preferito(annuncioFreelancers: annuncio);
        return Right(preferito);
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
  Future<Either<Failure, Unit>> aggiornaPreferito(
      PreferitiParams params) async {
    try {
      await preferitiDataSource.aggiornaPreferito(params.preferito);
      return const Right(unit);
    } on Exception {
      return Left(GenericFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> aggiungiPreferito(PreferitiParams param) async {
    try {
      await preferitiDataSource.aggiungiPreferito(param.preferito);
      return const Right(unit);
    } on Exception {
      return Left(GenericFailure());
    }
  }

  @override
  Future<Either<Failure, ListaPreferiti>> fetchListaPreferiti(
      PreferitiFiltersParams params) async {
    try {
      var lista = await preferitiDataSource.fetchListaPreferiti();
      //ora la filtro con il searchTerm
      ListaPreferiti listaFiltrata = [];
      for (var preferito in lista) {
        for (var element in preferito.descrizioneOfferta) {
          if (element.plainText.contains(params.searchTerm)) {
            if (listaFiltrata.indexWhere(
                    (element) => element.annuncioId == preferito.annuncioId) !=
                -1) {
              listaFiltrata.add(preferito);
            }
          }
        } //fine su descrizioneOfferta
        for (var element in preferito.tempistiche) {
          if (element.plainText.contains(params.searchTerm)) {
            if (listaFiltrata.indexWhere(
                    (element) => element.annuncioId == preferito.annuncioId) !=
                -1) {
              listaFiltrata.add(preferito);
            }
          }
        } //fine su tempistiche
        for (var element in preferito.tempistichePagamento) {
          if (element.plainText.contains(params.searchTerm)) {
            if (listaFiltrata.indexWhere(
                    (element) => element.annuncioId == preferito.annuncioId) !=
                -1) {
              listaFiltrata.add(preferito);
            }
          }
        } //fine se tempistichePagamento
        for (var element in preferito.richiestaDiLavoro) {
          if (element.plainText.contains(params.searchTerm)) {
            if (listaFiltrata.indexWhere(
                    (element) => element.annuncioId == preferito.annuncioId) !=
                -1) {
              listaFiltrata.add(preferito);
            }
          }
        } //fine filtro su richiesta di lavoro
        for (var element in preferito.descrizioneProgetto) {
          if (element.plainText.contains(params.searchTerm)) {
            if (listaFiltrata.indexWhere(
                    (element) => element.annuncioId == preferito.annuncioId) !=
                -1) {
              listaFiltrata.add(preferito);
            }
          }
        } //fine su descrizione progetto
        for (var element in preferito.budget) {
          if (element.plainText.contains(params.searchTerm)) {
            if (listaFiltrata.indexWhere(
                    (element) => element.annuncioId == preferito.annuncioId) !=
                -1) {
              listaFiltrata.add(preferito);
            }
          }
        } //fine budget
        if (preferito.titolo.contains(params.searchTerm)) {
          if (listaFiltrata.indexWhere(
                  (element) => element.annuncioId == preferito.annuncioId) !=
              -1) {
            listaFiltrata.add(preferito);
          }
        }
      }
      //TODO fare ricerca
      return Right(params.isEmpty ? lista : listaFiltrata);
    } on Exception {
      return Left(GenericFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> rimuoviPreferito(PreferitiParams params) async {
    try {
      await preferitiDataSource.rimuoviPreferito(params.preferito.annuncioId);
      return const Right(unit);
    } on Exception {
      return Left(GenericFailure());
    }
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:job_app/app/resources/app_consts.dart';

import 'package:job_app/core/log/datasource_logger.dart';
import 'package:job_app/core/utils/filter_utils.dart';
import 'package:job_app/features/freelancers/data/datasources/freelancers_datasource.dart';
import 'package:job_app/features/freelancers/data/parsers/notion_freelancer_parser.dart';
import 'package:job_app/features/freelancers/domain/usecases/annunci_freelancer_params.dart';

import '../../../../app/resources/string_constants.dart';
import '../../../../core/domain/errors/exceptions.dart';
import '../models/annuncio_freelancers_model.dart';
import '../models/notion_response_dto_freelancers.dart';

class FreelancersDataSourceImpl
    with DatasourceLoggy
    implements FreelancersDatasource {
  final Dio dio;
  FreelancersDataSourceImpl({
    required this.dio,
  });

  @override
  Future<NotionResponseFreelancersDTO> fetchAnnuncioFreelancers(
      String annuncioId) async {
    try {
      List<AnnuncioFreelancersModel> listaAnnunci = [];
      final Response response =
          await dio.post(StringConsts.baseUrlPage + annuncioId, data: {});

      loggy.debug("REPONSE FROM NOTION: $response");
      listaAnnunci = parseNotionResponseFreelancers(response);

      if (listaAnnunci.length != 1) {
        throw Exception();
      }
      return NotionResponseFreelancersDTO(listaAnnunci: listaAnnunci);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.unknown) {
        throw NetworkException();
      }
      if (e.response!.statusCode == 404) {
        throw NoAnnuncioException();
      }
      rethrow;
    } on Exception {
      throw RestApiException();
    }
  }

  @override
  Future<NotionResponseFreelancersDTO> fetchPrimaPaginaAnnunciFreelancers(
      AnnunciFreelancersParams params) async {
    bool hasMore = true;
    String? nextCursor;
    List<AnnuncioFreelancersModel> listaAnnunci = [];
    try {
      Map<String, dynamic> payload = {
        "page_size":
            kNumeroDiAnnunciPerPagina, //per provare la paginazione se no default è 10 per notion
      };

      if (!params.isEmpty) {
        payload["filter"] = {};
        var listaFiltri = buildFilterMapFromParamsFreelancers(params);
        if (params.numberOfTypeOfFilter == 1) {
          payload['filter'] =
              listaFiltri.length == 1 ? listaFiltri[0] : listaFiltri;
        } else {
          payload['filter']['and'] =
              listaFiltri.length == 1 ? listaFiltri[0] : listaFiltri;
        }
      }
      String payloadString = jsonEncode(payload); //per debug
      final Response response =
          await dio.post(StringConsts.baseUrlFreelancers, data: payload);
      loggy.debug("REPONSE FROM NOTION: $response");
      loggy.debug(response.data["next_cursor"]);

      if (response.data["next_cursor"] != null) {
        nextCursor = response.data["next_cursor"] as String;
      }
      if (response.data["has_more"] != null) {
        hasMore = response.data["has_more"] as bool;
      }
      listaAnnunci = parseNotionResponseFreelancers(response);
      return NotionResponseFreelancersDTO(
        listaAnnunci: listaAnnunci,
        hasMore: hasMore,
        nextCursor: nextCursor,
      );
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.unknown) {
        throw NetworkException();
      } else if (e.type == DioErrorType.badResponse) {
        throw const ServerException();
      }
      rethrow;
    } on Exception {
      throw RestApiException();
    }
  }

  @override
  Future<NotionResponseFreelancersDTO> fetchProssimaPaginaAnnunciFreelancers(
      String startCursor, AnnunciFreelancersParams params) async {
    bool hasMore = true;
    String? nextCursor;
    List<AnnuncioFreelancersModel> listaAnnunci = [];
    try {
      Map<String, dynamic> payload = {
        "page_size":
            kNumeroDiAnnunciPerPagina, //per provare la paginazione se no default è 10 per notion
      };
      if (!params.isEmpty) {
        payload["filter"] = {};
        var listaFiltri = buildFilterMapFromParamsFreelancers(params);
        if (params.numberOfTypeOfFilter == 1) {
          payload['filter'] =
              listaFiltri.length == 1 ? listaFiltri[0] : listaFiltri;
        } else {
          payload['filter']['and'] =
              listaFiltri.length == 1 ? listaFiltri[0] : listaFiltri;
        }
      }
      payload["start_cursor"] = startCursor;
      String payloadString = jsonEncode(payload); //PER DEBUG
      final Response response =
          await dio.post(StringConsts.baseUrlFreelancers, data: payload);
      loggy.debug("REPONSE FROM NOTION: $response");
      loggy.debug(response.data["next_cursor"]);
      if (response.data["next_cursor"] != null) {
        nextCursor = response.data["next_cursor"] as String;
      } else {
        hasMore = false;
      }
      if (response.data["has_more"] != null) {
        hasMore = response.data["has_more"] as bool;
      }
      listaAnnunci = parseNotionResponseFreelancers(response);
      return NotionResponseFreelancersDTO(
        listaAnnunci: listaAnnunci,
        hasMore: hasMore,
        nextCursor: nextCursor,
      );
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.unknown) {
        throw NetworkException();
      } else if (e.type == DioErrorType.badResponse) {
        throw const ServerException();
      }
      rethrow;
    } on Exception {
      throw RestApiException();
    }
  }
}

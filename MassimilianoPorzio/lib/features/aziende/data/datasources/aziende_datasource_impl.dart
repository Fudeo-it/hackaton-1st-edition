import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:job_app/app/resources/app_consts.dart';
import 'package:job_app/core/utils/filter_utils.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/resources/string_constants.dart';
import '../../domain/usecases/annunci_azienda_params.dart';
import '../parsers/notion_azienda_parser.dart';
import '../models/annuncio_azienda_model.dart';
import '../models/notion_response_azienda.dart';
import '../../../../core/domain/errors/exceptions.dart';
import '../../../../core/log/datasource_logger.dart';

import 'aziende_datasource.dart';

class AziendeDatasourceImpl with DatasourceLoggy implements AziendeDatasource {
  final Dio dio;
  SharedPreferences prefs; //TODO forse non è + usato...

  AziendeDatasourceImpl({
    required this.dio,
    required this.prefs,
  });

  @override
  Future<NotionResponseAziendaDTO> fetchAnnunci() async {
    bool hasMore = true;
    String? nextCursor;
    List<AnnuncioAziendaModel> listaAnnunci = [];
    try {
      Map<String, dynamic> bodyRequest = {};

      final Response response =
          await dio.post(StringConsts.baseUrlAziende, data: bodyRequest);
      loggy.debug("REPONSE FROM NOTION: $response");

      loggy.debug(response.data["next_cursor"]);

      if (response.data["next_cursor"] != null) {
        nextCursor = response.data["next_cursor"] as String;
      }
      if (response.data["has_more"] != null) {
        hasMore = response.data["has_more"] as bool;
      }
      listaAnnunci = parseNotionResponseAziende(response);

      // loggy.debug("ECCO LA LISTA DEGLI ANNUNCI MODEL:\n$listaAnnunci");
      return NotionResponseAziendaDTO(
        listaAnnunci: listaAnnunci,
        hasMore: hasMore,
        nextCursor: nextCursor,
      );
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.unknown) {
        throw NetworkException();
      }
      rethrow;
    } on Exception {
      throw RestApiException();
    }
  }

  @override
  Future<NotionResponseAziendaDTO> fetchProssimaPaginaAnnunci(
      String startCursor, AnnunciAzParams params) async {
    List<AnnuncioAziendaModel> listaAnnunci = [];
    try {
      Map<String, dynamic> payload = {
        "page_size":
            kNumeroDiAnnunciPerPagina //per provare la paginazione se no default è 100 per notion
      };
      if (!params.isEmpty) {
        payload["filter"] = {};
        var listaFiltri = buildFilterMapFromParamsAz(params);
        if (params.numberOfTypeOfFilter == 1) {
          payload['filter'] =
              listaFiltri.length == 1 ? listaFiltri[0] : listaFiltri;
        } else {
          payload['filter']['and'] =
              listaFiltri.length == 1 ? listaFiltri[0] : listaFiltri;
        }
      }

      payload["start_cursor"] = startCursor;
      String payloadString = jsonEncode(payload);
      final Response response =
          await dio.post(StringConsts.baseUrlAziende, data: payload);
      loggy.debug("REPONSE FROM NOTION: $response");

      loggy.debug(response.data["next_cursor"]);

      bool hasMore = true; //c'è sempre fino a prova contraria
      String? nextCursor;
      if (response.data["next_cursor"] != null) {
        nextCursor = response.data["next_cursor"] as String;
      } else {
        hasMore = false;
      }
      if (response.data["has_more"] != null) {
        hasMore = response.data["has_more"] as bool;
      }
      listaAnnunci = parseNotionResponseAziende(response);

      // loggy.debug("ECCO LA LISTA DEGLI ANNUNCI MODEL:\n$listaAnnunci");
      return NotionResponseAziendaDTO(
        listaAnnunci: listaAnnunci,
        hasMore: hasMore,
        nextCursor: nextCursor,
      );
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.unknown) {
        throw NetworkException();
      }
      rethrow;
    } on Exception {
      throw RestApiException();
    }
  }

  @override
  Future<NotionResponseAziendaDTO> fetchPrimaPaginaAnnunci(
      AnnunciAzParams params) async {
    //*searchTerm in OR con i FILTRI (a loro volta tutti in OR)
    bool hasMore = true;
    String? nextCursor;
    List<AnnuncioAziendaModel> listaAnnunci = [];
    try {
      Map<String, dynamic> payload = {
        "page_size":
            kNumeroDiAnnunciPerPagina, //per provare la paginazione se no default è 10 per notion
      };

      if (!params.isEmpty) {
        payload["filter"] = {};
        var listaFiltri = buildFilterMapFromParamsAz(params);
        if (params.numberOfTypeOfFilter == 1) {
          payload['filter'] =
              listaFiltri.length == 1 ? listaFiltri[0] : listaFiltri;
        } else {
          payload['filter']['and'] =
              listaFiltri.length == 1 ? listaFiltri[0] : listaFiltri;
        }
      }
      String payloadString = jsonEncode(payload);

      final Response response =
          await dio.post(StringConsts.baseUrlAziende, data: payload);
      loggy.debug("REPONSE FROM NOTION: $response");

      loggy.debug(response.data["next_cursor"]);

      if (response.data["next_cursor"] != null) {
        nextCursor = response.data["next_cursor"] as String;
      }
      if (response.data["has_more"] != null) {
        hasMore = response.data["has_more"] as bool;
      }
      listaAnnunci = parseNotionResponseAziende(response);

      // loggy.debug("ECCO LA LISTA DEGLI ANNUNCI MODEL:\n$listaAnnunci");
      return NotionResponseAziendaDTO(
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
  Future<NotionResponseAziendaDTO> fetchAnnuncio(String annuncioId) async {
    try {
      List<AnnuncioAziendaModel> listaAnnunci = [];
      final Response response =
          await dio.post(StringConsts.baseUrlPage + annuncioId, data: {});

      loggy.debug("REPONSE FROM NOTION: $response");
      listaAnnunci = parseNotionResponseAziende(response);

      if (listaAnnunci.length != 1) {
        throw Exception();
      }
      return NotionResponseAziendaDTO(listaAnnunci: listaAnnunci);
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
}

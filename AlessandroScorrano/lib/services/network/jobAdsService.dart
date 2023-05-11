import 'dart:convert';
import 'dart:io';
import 'package:annunci_lavoro_flutter/services/network/dto/freelance_positions_dto.dart';
import 'package:annunci_lavoro_flutter/services/network/dto/frelance_positions_ads_response.dart';
import 'package:annunci_lavoro_flutter/services/network/dto/job_positions_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:annunci_lavoro_flutter/errors/network_error.dart';
import 'package:http/http.dart' as http;
import 'package:annunci_lavoro_flutter/services/network/dto/job_positions_ads_response.dart';

class AdsService {
  ///
  /// classe di servizio utilizzata per scaricare i dati dalle api di notion.
  ///
  /// ritorna la lista degli annunci sotto forma di DTO.
  ///
  /// include i metodi per scaricare un singolo annuncio per metterlo tra i preferiti
  ///
  /// tutti i dati riservati sono nel file .env per garantire la riservatezza. */
  ///

  static String baseUrl = 'api.notion.com';
  static String jobPositionsPath =
      "v1/databases/${dotenv.env['JOB_POSITIONS_DATABASE']}/query";
  static String freelancePositionsPath =
      "v1/databases/${dotenv.env['FREELANCE_POSITIONS_DATABASE']}/query";

  static String favouritesPath = "v1/pages/";

  /// metodo per scaricare i dati dal database degli annunci di lavoro.

  Future<JobsPositionsResponse> getJobPositionsAds(
      [String? startCursor]) async {
    final url = Uri.https(
      baseUrl,
      jobPositionsPath,
    );

    final response = await http.post(
      url,
      body: json.encode(startCursor != null
          ? {"page_size": 5, 'start_cursor': startCursor}
          : {"page_size": 5}),
      headers: <String, String>{
        HttpHeaders.authorizationHeader: "${dotenv.env['NOTION_API_KEY']}",
        "Notion-Version": "${dotenv.env['NOTION_VERSION']}",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw NetworkError(
        response.statusCode,
        response.reasonPhrase,
      );
    }

    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return JobsPositionsResponse.fromJson(decodedResponse);
  }

  /// metodo per scaricare i dati dal database degli annunci Freelance.

  Future<FreelancePositionsresponse> getfreelanceAds(
      [String? startCursor]) async {
    final url = Uri.https(
      baseUrl,
      freelancePositionsPath,
    );

    final response = await http.post(
      url,
      body: json.encode(startCursor != null
          ? {"page_size": 5, 'start_cursor': startCursor}
          : {"page_size": 5}),
      headers: <String, String>{
        HttpHeaders.authorizationHeader: "${dotenv.env['NOTION_API_KEY']}",
        "Notion-Version": "${dotenv.env['NOTION_VERSION']}",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw NetworkError(
        response.statusCode,
        response.reasonPhrase,
      );
    }

    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return FreelancePositionsresponse.fromJson(decodedResponse);
  }

  /// metodo per scaricare un annuncio di tipo [JobPosition] per metterlo nei preferiti

  Future<JobsPositionsAdsDTO?> getJobPositionsFavourite(
      String favouriteId) async {
    final url = Uri.https(
      baseUrl,
      "$favouritesPath$favouriteId",
    );

    final response = await http.get(
      url,
      headers: <String, String>{
        HttpHeaders.authorizationHeader: "${dotenv.env['NOTION_API_KEY']}",
        "Notion-Version": "${dotenv.env['NOTION_VERSION']}",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode < 200 || response.statusCode > 299) {
      return null;
    }

    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return JobsPositionsAdsDTO.fromJson(decodedResponse);
  }

  /// metodo per scaricare un annuncio di tipo [FreelancePosition] per metterlo nei preferiti

  Future<FreelancePositionsAdsDTO?> getFreelanceFavourite(
      String favouriteId) async {
    final url = Uri.https(
      baseUrl,
      "$favouritesPath$favouriteId",
    );

    final response = await http.get(
      url,
      headers: <String, String>{
        HttpHeaders.authorizationHeader: "${dotenv.env['NOTION_API_KEY']}",
        "Notion-Version": "${dotenv.env['NOTION_VERSION']}",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode < 200 || response.statusCode > 299) {
      return null;
    }

    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return FreelancePositionsAdsDTO.fromJson(decodedResponse);
  }
}

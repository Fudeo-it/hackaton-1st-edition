import 'dart:convert';
import 'dart:io';

import 'package:offertelavoroflutter/errors/network_error.dart';
import 'package:offertelavoroflutter/services/network/dto/freelance_project_dto.dart';
import 'package:offertelavoroflutter/services/network/dto/freelance_project_response.dart';
import 'package:offertelavoroflutter/services/network/dto/announcement_dto.dart';
import 'package:http/http.dart' as http;
import 'package:offertelavoroflutter/services/network/dto/announcement_response.dart';

class JobOfferNetworkService {
  static const _queryDatabaseEndPoint = '/v1/databases/<DATABASE-ID>/query';
  static const _pagesEndPoint = '/v1/pages';
  static const _headerNotionVersion = 'Notion-Version';
  static const _headerAthorization = 'Authorization';
  static const _dbAnnouncement = '283d2760f81548f0a7baca4b3e58d7d8';
  static const _dbFreelance = 'e6a8a6760e3d4430b20a15d16f75f92e';
  static const _token =
      'Bearer secret_Azc2DHy4JY0Ved0cD0ObrEFJqIaUqy96CboXgJZp8bZ';
  static const _apiVersion = '2022-06-28';
  final String baseUrl;

  const JobOfferNetworkService({
    required this.baseUrl,
  });

  Future<List<AnnouncementDTO>> announcements() async {
    final decodedResponse = await _offers(db: _dbAnnouncement);
    return AnnouncementResponse.fromJson(decodedResponse).results;
  }

  Future<List<FreelanceProjectDTO>> freelanceProjects() async {
    final decodedResponse = await _offers(db: _dbFreelance);
    return FreelanceProjectResponse.fromJson(decodedResponse).results;
  }

  Future<AnnouncementDTO?> announcementById(String id) async {
    final decodedResponse = await _offerById(id);
    if (decodedResponse == null) {
      return null;
    }
    return AnnouncementDTO.fromJson(decodedResponse);
  }

  Future<FreelanceProjectDTO?> freelanceProjectById(String id) async {
    final decodedResponse = await _offerById(id);
    if (decodedResponse == null) {
      return null;
    }
    return FreelanceProjectDTO.fromJson(decodedResponse);
  }

  Future<Map<String, dynamic>?> _offerById(String id) async {
    final unencodedPath = '$_pagesEndPoint/$id';
    final response = await http.get(
      Uri.https(baseUrl, unencodedPath),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json;',
        _headerAthorization: _token,
        _headerNotionVersion: _apiVersion,
      },
    );
    if (response.statusCode < 200 || response.statusCode > 299) {
      final errorBodyDecode = jsonDecode(response.body) as Map<String, dynamic>;
      if (errorBodyDecode['status'] == 404 &&
          errorBodyDecode['code'] == 'object_not_found') {
        return null;
      }
      throw NetworkError(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase,
      );
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> _offers({
    required String db,
  }) async {
    final unencodedPath = _queryDatabaseEndPoint.replaceAll(
      '<DATABASE-ID>',
      db,
    );
    final response = await http.post(
      Uri.https(baseUrl, unencodedPath),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json;',
        _headerAthorization: _token,
        _headerNotionVersion: _apiVersion
      },
    );
    if (response.statusCode < 200 || response.statusCode > 299) {
      throw NetworkError(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase,
      );
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}

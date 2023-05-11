import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:offertelavoroflutter/errors/network_error.dart';
import 'package:offertelavoroflutter/services/network/dto/job_announcements_response.dart';
import 'package:offertelavoroflutter/services/network/dto/job_dto.dart';

class JobsService {
  static String auth =
      'Bearer secret_Azc2DHy4JY0Ved0cD0ObrEFJqIaUqy96CboXgJZp8bZ';
  static String baseUrl = 'api.notion.com';
  static String path = '/v1/databases/283d2760f81548f0a7baca4b3e58d7d8/query/';

  Future<List<JobDTO>> jobs() async {
    final response = await http.post(
      Uri.https(baseUrl, path),
      headers: <String, String>{
        HttpHeaders.authorizationHeader: auth,
        'Notion-Version': '2022-06-28',
      },
    );

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw NetworkError(
        response.statusCode,
        response.reasonPhrase,
      );
    }

    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return JobAnnouncementsResponse.fromJson(decodedResponse).results;
  }

  // Ritorna il json per intero
  Future<JobAnnouncementsResponse> jobAnnouncement() async {
    final response = await http.post(
      Uri.https(baseUrl, auth, {}),
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'Notion-Version: 2021-05-11',
      },
    );

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw NetworkError(
        response.statusCode,
        response.reasonPhrase,
      );
    }

    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return JobAnnouncementsResponse.fromJson(decodedResponse);
  }
}

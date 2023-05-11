import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:offertelavoroflutter_it_app/errors/network_error.dart';
import 'package:offertelavoroflutter_it_app/services/network/dto/jobs_response.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';

class JobsService {
  final String baseUrl;

  JobsService({
    required this.baseUrl,
  });

  Future<List<JobsResponse>> fetchJobs(String databaseId) async {
    final response = await http
        .post(Uri.parse("$baseUrl/databases/$databaseId/query"), headers: {
      "Notion-Version": K.headerNotionVersion,
      HttpHeaders.authorizationHeader: K.headerAuthKey,
    });

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final jsonResults = jsonBody["results"] as List;

      return jsonResults
          .map((response) => JobsResponse.fromJson(response))
          .toList(growable: false);
    } else {
      throw NetworkError(response.statusCode, response.reasonPhrase);
    }
  }
}

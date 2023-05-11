import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:offertelavoroflutter/errors/network_error.dart';
import 'package:offertelavoroflutter/services/network/notion/dto/databases_response.dart';
import 'package:http/http.dart' as http;

class DatabasesService {

  static Map<String, String> databases = {
    'recruitment': dotenv.env['DB_RECRUITMENT'] ?? '',
    'freelance': dotenv.env['DB_FREELANCE'] ?? '',
  };

  final String baseUrl = dotenv.env['BASE_URL'] ?? 'api.notion.com';
  final String notionVersion = dotenv.env['NOTION_VERSION'] ?? '2022-06-28';
  final String authorizationHeader = 'Bearer ${dotenv.env['NOTION_API_KEY'] ?? ''}';
  final String contentType = 'application/json';
  final int pageSize = 4; // (4 for testing) minimum 10 recommended

  DatabasesService();

  Future<DatabasesResponse> pages(String dbName, { Map<String, dynamic> params = const {} }) async {
    String? databaseId = DatabasesService.databases[dbName];
    if (databaseId == null) {
      throw NetworkError(500, 'database id is null');
    }
    var url = Uri.https(baseUrl, 'v1/databases/$databaseId/query');
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: contentType,
      HttpHeaders.authorizationHeader: authorizationHeader,
      'Notion-Version': notionVersion,
    };
    print(params);
    Map<String, dynamic> body = {
      "page_size": pageSize,
      ...params,
    };
    final response = await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw NetworkError(response.statusCode, response.reasonPhrase);
    }

    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return DatabasesResponse.fromJson(decodedResponse);
  }
}
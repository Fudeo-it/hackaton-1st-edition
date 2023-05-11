import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:offertelavoroflutter_app/constants/env.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/api_error/notion_api_error.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/db_query_request/notion_db_query_request.dart';

Map<String, dynamic> notionDbQueryRequestToJson(NotionDbQueryRequest notionDbQueryRequest) {
  return notionDbQueryRequest.toJson();
}

class NotionApiClient {
  static const notionApiEndpoint = 'https://api.notion.com/v1';
  static const notionApiVersion = '2022-06-28';
  static const hiringJobOffersDatabase = '283d2760f81548f0a7baca4b3e58d7d8';
  static const freelanceJobOffersDatabase = 'e6a8a6760e3d4430b20a15d16f75f92e';

  Future<http.Response> makeRequest(HttpMethods method, String relativeUrl, {
    Map<String, dynamic>? body,
  }) async {
    Uri uri = Uri.parse(notionApiEndpoint + relativeUrl);
    Map<String, String> headers = _getRequestHeaders();
    String? bodyString = (body != null) ? json.encode(body) : null;

    http.Response response;

    switch(method) {
      case HttpMethods.get:
        response = await http.get(uri, headers: headers);
        break;

      case HttpMethods.post:
        response = await http.post(uri, headers: headers, body: bodyString);
        break;

      case HttpMethods.put:
        response = await http.put(uri, headers: headers, body: bodyString);
        break;

      case HttpMethods.patch:
        response = await http.patch(uri, headers: headers, body: bodyString);
        break;

      case HttpMethods.delete:
        response = await http.delete(uri, headers: headers);
        break;

      default:
        throw Exception('Unsupported method: $method');
    }

    _maybeHandleError(response);
    return response;
  }

  _maybeHandleError(http.Response response) {
    if(_isErrorStatusCode(response.statusCode)) {
      // This json is very light so we don't need isolates
      throw NotionApiError.fromJson(json.decode(response.body));
    }
  }

  Map<String, String> _getRequestHeaders() {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer ${Env.notionApiKey}',
      'Notion-Version': notionApiVersion,
    };
  }

  bool _isErrorStatusCode(int statusCode) {
    return statusCode >= 400;
  }
}

enum HttpMethods {
  get,
  post,
  put,
  patch,
  delete
}
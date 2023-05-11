import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:offertelavoroflutter/models/models.dart';

class Api {
  static const String _baseUrl = 'https://api.notion.com/v1/databases/';

  static const String recruitmentDatabase = '283d2760f81548f0a7baca4b3e58d7d8';
  static const String freelanceDatabase = 'e6a8a6760e3d4430b20a15d16f75f92e';

  get headers {
    return {
      "Authorization":
          "Bearer secret_Azc2DHy4JY0Ved0cD0ObrEFJqIaUqy96CboXgJZp8bZ",
      "Notion-Version": "2022-06-28",
      "Content-Type": "application/json",
    };
  }

  Future<List<NotionObject>>? jobPostingsRecruitment() async {
    try {
      final Response response = await Client().post(
        Uri.parse('$_baseUrl$recruitmentDatabase/query'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return (data['results'] as List).map((e) {
          if (e is Map<String, dynamic>) {
            final notionObject = NotionObject.fromJson(e);
            log(notionObject.toString());
            return NotionObject.fromJson(e);
          }
          return const NotionObject();
        }).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<NotionObject>>? jobPostingsFreelance() async {
    try {
      final Response response = await Client().post(
        Uri.parse('$_baseUrl$freelanceDatabase/query'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return (data['results'] as List).map((e) {
          if (e is Map<String, dynamic>) {
            return NotionObject.fromJson(e);
          }
          return const NotionObject();
        }).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}

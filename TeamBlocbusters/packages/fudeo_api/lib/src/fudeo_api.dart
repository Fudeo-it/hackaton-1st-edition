import 'dart:convert';
import 'package:fudeo_api/src/models/notion_database_query_response.dart';
import 'package:fudeo_api/src/models/notion_freelance_project_page.dart';
import 'package:fudeo_api/src/models/notion_job_offer_page.dart';
import 'package:http/http.dart';

class FudeoAPI {
  Future<NotionDatabaseQueryResponse<NotionJobOfferPage>> getJobOffers() async {
    final response = await post(
      Uri.parse(
        'https://api.notion.com/v1/databases/283d2760f81548f0a7baca4b3e58d7d8/query',
      ),
      headers: {
        'Authorization':
            'Bearer secret_Azc2DHy4JY0Ved0cD0ObrEFJqIaUqy96CboXgJZp8bZ',
        'Notion-Version': '2022-06-28',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return NotionDatabaseQueryResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
        NotionJobOfferPage.fromJson,
      );
    } else {
      throw Exception('Failed to load job offers');
    }
  }

  Future<NotionDatabaseQueryResponse<NotionFreelanceProjectPage>>
      getFreelanceProjects() async {
    final response = await post(
      Uri.parse(
        'https://api.notion.com/v1/databases/e6a8a6760e3d4430b20a15d16f75f92e/query',
      ),
      headers: {
        'Authorization':
            'Bearer secret_Azc2DHy4JY0Ved0cD0ObrEFJqIaUqy96CboXgJZp8bZ',
        'Notion-Version': '2022-06-28',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return NotionDatabaseQueryResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
        NotionFreelanceProjectPage.fromJson,
      );
    } else {
      throw Exception('Failed to load freelance projects');
    }
  }
}

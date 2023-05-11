import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soluzione1_hackathon_fudeo_flutter/env/env.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/notion_page.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/utils/request_headers.dart'
    as request_headers;

class NotionRepository {
  NotionRepository();

  Future<List<NotionPage>?> getAnnunciLavoroList() async {
    var response = await http.post(
      Uri.parse('${Env.notionBaseUrl}/${Env.notionDBAnnunci}/query'),
      headers: request_headers.getNotionHeaders(),
      body: '{"page_size": 100}',
    );

    final responseBodyParsed = json.decode(response.body);
    return responseBodyParsed["results"]
        .map<NotionPage>((json) => NotionPage.fromJson(json))
        .toList();
  }

  Future<List<NotionPage>?> getProgettiFreelanceList() async {
    var response = await http.post(
      Uri.parse('${Env.notionBaseUrl}/${Env.notionDBProgetti}/query'),
      headers: request_headers.getNotionHeaders(),
      body: '{"page_size": 100}',
    );

    final responseBodyParsed = json.decode(response.body);
    return responseBodyParsed["results"]
        .map<NotionPage>((json) => NotionPage.fromJson(json))
        .toList();
  }
}

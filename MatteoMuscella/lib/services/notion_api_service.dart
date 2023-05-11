import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jobs_search/models/api_models.dart';
import 'package:jobs_search/models/app_models.dart';

class ApiServiceModel {
  final bool hasMore;
  final String? nextCursor;
  final List<JobOffer> jobOffers;

  ApiServiceModel(this.jobOffers, this.hasMore, this.nextCursor);
}

class NotionApiService {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.notion.com/v1/databases/',
      connectTimeout: const Duration(seconds: 10),
      headers: {
        'Authorization':
            'Bearer ${dotenv.env['NOTION_API_KEY']}',
        'Notion-Version': '2022-06-28',
      },
    ),
  );

  Future<ApiServiceModel> fetchJobOffers(String dbId, NotionQuery query, String offerType) async {
    return fetchFromDb(dbId, query, offerType);
  }

  Future<ApiServiceModel> fetchFromDb(String dbId, NotionQuery query, String offerType) async {
    var postData = query.toJson();
    debugPrint(
        'Calling API: https://api.notion.com with db id: $dbId and json: $postData');

    var res = await dio.post('$dbId/query', data: postData);

    var notionApiResponse = parseJson(res.data);

    var nOfResults = notionApiResponse.results.length;
    var hasMore = notionApiResponse.hasMore;
    var nextCursor = notionApiResponse.nextCursor;
    debugPrint(
        'Received $nOfResults results, dbId: $dbId, hasMore: $hasMore, nextCursor: $nextCursor');

    List<JobOffer> jobOffers = [];
    for (var page in notionApiResponse.results) {
      jobOffers.add(makeJobOffer(page, offerType));
    }

    return ApiServiceModel(
      jobOffers,
      notionApiResponse.hasMore,
      notionApiResponse.nextCursor,
    );
  }

  JobOffer makeJobOffer(Result page, String offerType) {
    var props = page.properties;
    var offer = JobOffer(
      DateTime.parse(page.createdTime ?? ''),
      DateTime.parse(page.lastEditedTime ?? ''),
      page.id ?? '',
      offerType: offerType == 'hiring' ? OfferType.hiring : OfferType.freelance
      // jobName: findJobName(props),
    );
    offer.props = props;
    return offer;
  }

  String findJobName(Map<String, dynamic> props) {
    return props.values
        .where((notionNode) => notionNode['type'] == 'title')
        .map(
          (notionNode) =>
              notionNode['title'].fold('', (acc, text) => '$acc $text'),
        )
        .join('');
  }

  NotionApiResponse parseJson(Map<String, dynamic> json) {
    return NotionApiResponse.fromJson(json);
  }

  String parseNotionNode(Map<String, dynamic> json, String prop,
      {String textNode = 'plain_text'}) {
    var node = json[prop];
    if (node == null) {
      debugPrint('La prop $prop non esiste nel json');
      return '';
    }

    var type = node['type'];
    if (node[type] == null) {
      return '';
    }

    var obj = node[type];

    if (obj is Iterable) {
      return obj.map((x) => x[textNode]).join(' ');
    }

    if (obj is Map) {
      return obj[prop] ?? '';
    }

    debugPrint('Node parsing failed: ${node[type]}');

    return '';
  }

  int parseMinSalary(Map<String, dynamic> json, String prop) {
    var node = json[prop];
    if (node == null) {
      debugPrint('La prop $prop non esiste nel json');
      return 0;
    }

    var type = node['type'];

    List<dynamic> texts = node[type];
    if (texts.isEmpty) {
      return 0;
    }

    return parseSalaryString(texts[0]['plain_text'])[0];
  }

  int parseMaxSalary(Map<String, dynamic> json, String prop) {
    var node = json[prop];
    if (node == null) {
      debugPrint('La prop $prop non esiste nel json');
      return 0;
    }

    var type = node['type'];

    List<dynamic> texts = node[type];
    if (texts.isEmpty) {
      return 0;
    }

    return parseSalaryString(texts[0]['plain_text'])[1];
  }

  List<int> parseSalaryString(String salaryString) {
    List<int> nums = [];
    String num = '';
    bool numberFound = false;
    for (var c in salaryString.split('')) {
      if (RegExp(r'[0-9]').hasMatch(c)) {
        numberFound = true;
      }
      if (numberFound && RegExp(r'[a-zA-Z\- ]').hasMatch(c)) {
        nums.add(int.parse(num));
        numberFound = false;
        num = '';
      }
      if (numberFound) {
        num += c;
      }
    }
    return nums;
  }
}

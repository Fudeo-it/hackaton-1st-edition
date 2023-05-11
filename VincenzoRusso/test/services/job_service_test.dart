import 'package:data_fixture_dart/misc/fixture_tuple.dart';
import 'package:dio/dio.dart';
import 'package:offertelavoroflutter_app/services/network/dto/notion_response.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:offertelavoroflutter_app/services/network/dto/query_notion_request.dart';
import 'package:offertelavoroflutter_app/services/network/job_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/notion_response_fixture_factory.dart';

void main() {
  late FixtureTuple<NotionResponse> notionResponse;

  late Dio dio;
  late DioAdapter dioAdapter;

  late JobService jobService;

  setUp(() {
    notionResponse = NotionResponseFixture.factory().makeSingleWithJsonObject();

    dio = Dio(BaseOptions());
    dioAdapter = DioAdapter(
      dio: dio,
      matcher: const UrlRequestMatcher(),
    );

    jobService = JobService(
      dio,
    );
  });

  group(
    "test query to job database",
    () {
      test(
        "get jobs successfully",
        () async {
          dioAdapter.onPost(
            "/databases/283d2760f81548f0a7baca4b3e58d7d8/query",
            (server) => server.reply(200, notionResponse.json),
            data: QueryNotionRequest().toJson(),
            headers: {},
            queryParameters: {},
          );

          final response = await jobService.fetchJobList(QueryNotionRequest());

          expect(response, notionResponse.object);
        },
      );

      test(
        "get jobs with unexpected error",
        () async {
          dioAdapter.onPost(
            "/databases/283d2760f81548f0a7baca4b3e58d7d8/query",
            (server) => server.reply(500, null),
            data: QueryNotionRequest().toJson(),
            headers: {},
            queryParameters: {},
          );

          expect(
            () async => jobService.fetchJobList(QueryNotionRequest()),
            throwsException,
          );
        },
      );
    },
  );

  group(
    "test query to freelance database",
    () {
      test(
        "get freelance list successfully",
        () async {
          dioAdapter.onPost(
            "/databases/e6a8a6760e3d4430b20a15d16f75f92e/query",
            (server) => server.reply(200, notionResponse.json),
            data: QueryNotionRequest().toJson(),
            headers: {},
            queryParameters: {},
          );

          final response =
              await jobService.fetchFreelanceList(QueryNotionRequest());

          expect(response, notionResponse.object);
        },
      );

      test(
        "get freelance list with unexpected error",
        () async {
          dioAdapter.onPost(
            "/databases/e6a8a6760e3d4430b20a15d16f75f92e/query",
            (server) => server.reply(500, null),
            data: QueryNotionRequest().toJson(),
            headers: {},
            queryParameters: {},
          );

          expect(
            () async => jobService.fetchFreelanceList(QueryNotionRequest()),
            throwsException,
          );
        },
      );
    },
  );

  group(
    "test get job or freelance job by id",
    () {
      test(
        "get job or freelance job with job's id successfully",
        () async {
          dioAdapter.onGet(
            "/pages/1d",
            (server) => server.reply(200, notionResponse.json["results"][0]),
            data: {},
            headers: {},
            queryParameters: {},
          );

          final response = await jobService.jobByID("1d");

          expect(response, notionResponse.object.results.first);
        },
      );

      test(
        "get job or freelance job with job's id with unexpected error",
        () {
          dioAdapter.onGet(
            "/pages/1d",
            (server) => server.reply(500, null),
            data: {},
            headers: {},
            queryParameters: {},
          );

          expect(
            () async => jobService.jobByID("1d"),
            throwsException,
          );
        },
      );
    },
  );
}

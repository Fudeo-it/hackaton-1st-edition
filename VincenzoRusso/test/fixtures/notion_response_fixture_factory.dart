import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:offertelavoroflutter_app/services/network/dto/notion_response.dart';

import 'job_dto_fixture_factory.dart';

extension NotionResponseFixture on NotionResponse {
  static NotionResponseFixtureFactory factory([bool hasMore = false]) =>
      NotionResponseFixtureFactory(hasMore);
}

class NotionResponseFixtureFactory extends JsonFixtureFactory<NotionResponse> {
  final bool hasMore;

  NotionResponseFixtureFactory([this.hasMore = false]);

  @override
  FixtureDefinition<NotionResponse> definition() => define(
        (faker) => NotionResponse(
          object: "list",
          results: JobDTOFixture.factory().makeMany(3),
          nextCursor: hasMore ? "f7c1e8ec-be69-4b40-96f0-bad87b44a1fc" : null,
          hasMore: hasMore,
          type: "page",
          page: {},
        ),
      );

  @override
  JsonFixtureDefinition<NotionResponse> jsonDefinition() => defineJson(
        (object) => {
          K.objectKey: object.object,
          K.resultsKey:
              JobDTOFixture.factory().makeJsonArrayFromMany(object.results),
          K.nextCursorKey: object.nextCursor,
          K.hasMoreKey: object.hasMore,
          K.typeKey: object.type,
          K.pageKey: object.page,
        },
      );
}

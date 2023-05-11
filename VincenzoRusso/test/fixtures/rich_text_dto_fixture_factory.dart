import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:offertelavoroflutter_app/services/network/dto/rich_text_dto.dart';

import 'text_dto_fixture_factory.dart';

extension RichTextDTOFixture on RichTextDTO {
  static RichTextDTOFixtureFactory factory() => RichTextDTOFixtureFactory();
}

class RichTextDTOFixtureFactory extends JsonFixtureFactory<RichTextDTO> {
  @override
  FixtureDefinition<RichTextDTO> definition() => define(
        (faker) => RichTextDTO(
          id: faker.randomGenerator.fromCharSet(
            "046fcebc-485f-4af8-931b-38b03c545ea8",
            "046fcebc-485f-4af8-931b-38b03c545ea8".length,
          ),
          type: "created_time",
          richText: TextDTOFixture.factory().makeMany(3),
        ),
      );

  @override
  JsonFixtureDefinition<RichTextDTO> jsonDefinition() => defineJson(
        (object) => {
          K.idKey: object.id,
          K.typeKey: object.type,
          K.richTextKey:
              TextDTOFixture.factory().makeJsonArrayFromMany(object.richText),
        },
      );
}

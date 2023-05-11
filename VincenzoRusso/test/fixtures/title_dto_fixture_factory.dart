import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:offertelavoroflutter_app/services/network/dto/title_dto.dart';

import 'text_dto_fixture_factory.dart';

extension TitleDTOFixture on TitleDTO {
  static TitleDTOFixtureFactory factory() => TitleDTOFixtureFactory();
}

class TitleDTOFixtureFactory extends JsonFixtureFactory<TitleDTO> {
  @override
  FixtureDefinition<TitleDTO> definition() => define(
        (faker) => TitleDTO(
          id: faker.randomGenerator.fromCharSet(
            "*.%3D%26",
            "*.%3D%26".length,
          ),
          type: "title",
          title: TextDTOFixture.factory().makeMany(1),
        ),
      );

  @override
  JsonFixtureDefinition<TitleDTO> jsonDefinition() => defineJson(
        (object) => {
          K.idKey: object.id,
          K.typeKey: object.type,
          K.titleKey:
              TextDTOFixture.factory().makeJsonArrayFromMany(object.title),
        },
      );
}

import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:offertelavoroflutter_app/services/network/dto/created_time_dto.dart';

extension CreatedTimeDTOFixture on CreatedTimeDTO {
  static CreatedTimeDTOFixtureFactory factory() =>
      CreatedTimeDTOFixtureFactory();
}

class CreatedTimeDTOFixtureFactory extends JsonFixtureFactory<CreatedTimeDTO> {
  @override
  FixtureDefinition<CreatedTimeDTO> definition() => define(
        (faker) => CreatedTimeDTO(
          id: faker.randomGenerator.fromCharSet(
            "*.%3D%26",
            "*.%3D%26".length,
          ),
          type: "created_time",
          createdTime: "2023-02-03T09:03:00.000Z",
        ),
      );

  @override
  JsonFixtureDefinition<CreatedTimeDTO> jsonDefinition() => defineJson(
        (object) => {
          K.idKey: object.id,
          K.typeKey: object.type,
          K.createdTimeKey: object.createdTime,
        },
      );
}

import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:offertelavoroflutter_app/services/network/dto/select_dto.dart';

extension SelectDTOFixture on SelectDTO {
  static SelectDTOFixtureFactory factory(List<String> list) =>
      SelectDTOFixtureFactory(list);
}

class SelectDTOFixtureFactory extends JsonFixtureFactory<SelectDTO> {
  final List<String> list;

  SelectDTOFixtureFactory(this.list);

  @override
  FixtureDefinition<SelectDTO> definition() => define(
        (faker) => SelectDTO(
          id: faker.randomGenerator.fromCharSet(
            "*.%3D%26",
            "*.%3D%26".length,
          ),
          type: "select",
          select: SelectContentDTOFixture.factory(list).makeSingle(),
        ),
      );

  @override
  JsonFixtureDefinition<SelectDTO> jsonDefinition() => defineJson(
        (object) => {
          K.idKey: object.id,
          K.typeKey: object.type,
          K.selectKey: object.select == null
              ? null
              : SelectContentDTOFixture.factory(list)
                  .makeJsonObjectFromSingle(object.select!),
        },
      );
}

extension SelectContentDTOFixture on SelectContentDTO {
  static SelectContentDTOFixtureFactory factory(List<String> list) =>
      SelectContentDTOFixtureFactory(list);
}

class SelectContentDTOFixtureFactory
    extends JsonFixtureFactory<SelectContentDTO> {
  final List<String> list;
  SelectContentDTOFixtureFactory(this.list);

  @override
  FixtureDefinition<SelectContentDTO> definition() => define(
        (faker) => SelectContentDTO(
          id: faker.randomGenerator.fromCharSet(
            "8f86bbad-f831-4471-b258-093179a4b57c",
            "8f86bbad-f831-4471-b258-093179a4b57c".length,
          ),
          name: faker.randomGenerator.element<String>(list),
          color: faker.color.color(),
        ),
      );

  @override
  JsonFixtureDefinition<SelectContentDTO> jsonDefinition() => defineJson(
        (object) => {
          K.idKey: object.id,
          K.nameKey: object.name,
          K.colorKey: object.color,
        },
      );
}

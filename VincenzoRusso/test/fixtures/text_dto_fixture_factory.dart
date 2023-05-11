import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:offertelavoroflutter_app/services/network/dto/text_dto.dart';

extension TextDTOFixture on TextDTO {
  static TextDTOFixtureFactory factory() => TextDTOFixtureFactory();
}

class TextDTOFixtureFactory extends JsonFixtureFactory<TextDTO> {
  @override
  FixtureDefinition<TextDTO> definition() => define(
        (faker) => TextDTO(
          type: "text",
          text: TextContentDTO(
            content: "Testo di prova",
            link: null,
          ),
          annotations: AnnotationsDTO(
            bold: false,
            italic: false,
            strikethrough: false,
            underline: false,
            code: false,
            color: "default",
          ),
          plainText: "Testo di prova",
          href: null,
        ),
      );

  @override
  JsonFixtureDefinition<TextDTO> jsonDefinition() => defineJson(
        (object) => {
          K.typeKey: object.type,
          K.textKey: object.text?.toJson(),
          K.annotationsKey: object.annotations?.toJson(),
          K.plainTextKey: object.plainText,
          K.hrefKey: object.href,
        },
      );
}

import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:offertelavoroflutter_app/services/network/dto/properties_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/url_dto.dart';

import 'created_time_dto_fixture_factory.dart';
import 'rich_text_dto_fixture_factory.dart';
import 'select_dto_fixture_factory.dart';
import 'title_dto_fixture_factory.dart';

extension PropertiesDTOFixture on PropertiesDTO {
  static PropertiesDTOFixtureFactory factory() => PropertiesDTOFixtureFactory();
}

class PropertiesDTOFixtureFactory extends JsonFixtureFactory<PropertiesDTO> {
  @override
  FixtureDefinition<PropertiesDTO> definition() => define(
        (faker) => PropertiesDTO(
          jobPosted: CreatedTimeDTOFixture.factory().makeSingle(),
          team: SelectDTOFixture.factory(["Full Remote", "Ibrido", "In sede"])
              .makeSingle(),
          contratto:
              SelectDTOFixture.factory(["Part time", "Full time"]).makeSingle(),
          seniority: SelectDTOFixture.factory(["Junior", "Mid", "Senior"])
              .makeSingle(),
          ral:
              SelectDTOFixture.factory(["50k annui", "60k annui"]).makeSingle(),
          name: TitleDTOFixture.factory().makeSingle(),
          qualifica: RichTextDTOFixture.factory().makeSingle(),
          retribuzione: RichTextDTOFixture.factory().makeSingle(),
          descrizioneOfferta: RichTextDTOFixture.factory().makeSingle(),
          comeCandidarsi: RichTextDTOFixture.factory().makeSingle(),
          localita: RichTextDTOFixture.factory().makeSingle(),
          nomeAzienda: RichTextDTOFixture.factory().makeSingle(),
          statoDiPubblicazione: RichTextDTOFixture.factory().makeSingle(),
          urlSitoWeb: UrlDTO(
            id: "baf99b63-2636-40e3-8fd6-a113b1afa166",
            type: "url",
            url: null,
          ),
          tempistiche: RichTextDTOFixture.factory().makeSingle(),
          richiestaDiLavoro: RichTextDTOFixture.factory().makeSingle(),
          budget: RichTextDTOFixture.factory().makeSingle(),
          nda: SelectDTOFixture.factory(["Sì", "No"]).makeSingle(),
          codice: TitleDTOFixture.factory().makeSingle(),
          tempisticheDiPagamento: RichTextDTOFixture.factory().makeSingle(),
          descrizioneDelProgetto: RichTextDTOFixture.factory().makeSingle(),
          tipoDiRelazione: SelectDTOFixture.factory([
            "Con altri professionisti",
            "Solo con chi commissiona il lavoro",
          ]).makeSingle(),
        ),
      );

  @override
  JsonFixtureDefinition<PropertiesDTO> jsonDefinition() => defineJson(
        (object) => {
          K.jobPostedKey: object.jobPosted == null
              ? null
              : CreatedTimeDTOFixture.factory()
                  .makeJsonObjectFromSingle(object.jobPosted!),
          K.teamKey: object.team == null
              ? null
              : SelectDTOFixture.factory(["Full Remote", "Ibrido", "In sede"])
                  .makeJsonObjectFromSingle(object.team!),
          K.contractKey: object.contratto == null
              ? null
              : SelectDTOFixture.factory(["Part time", "Full time"])
                  .makeJsonObjectFromSingle(object.contratto!),
          K.seniorityKey: object.seniority == null
              ? null
              : SelectDTOFixture.factory(["Junior", "Mid", "Senior"])
                  .makeJsonObjectFromSingle(object.seniority!),
          K.ralKey: object.ral == null
              ? null
              : SelectDTOFixture.factory(["50k annui", "60k annui"])
                  .makeJsonObjectFromSingle(object.ral!),
          K.namePropertyKey: object.name == null
              ? null
              : TitleDTOFixture.factory()
                  .makeJsonObjectFromSingle(object.name!),
          K.qualificaKey: object.qualifica == null
              ? null
              : RichTextDTOFixture.factory()
                  .makeJsonObjectFromSingle(object.qualifica!),
          K.retribuzioneKey: object.retribuzione == null
              ? null
              : RichTextDTOFixture.factory()
                  .makeJsonObjectFromSingle(object.retribuzione!),
          K.descrizioneOffertaKey: object.descrizioneOfferta == null
              ? null
              : RichTextDTOFixture.factory()
                  .makeJsonObjectFromSingle(object.descrizioneOfferta!),
          K.comeCandidarsiKey: object.comeCandidarsi == null
              ? null
              : RichTextDTOFixture.factory()
                  .makeJsonObjectFromSingle(object.comeCandidarsi!),
          K.localitaKey: object.localita == null
              ? null
              : RichTextDTOFixture.factory()
                  .makeJsonObjectFromSingle(object.localita!),
          K.nomeAziendaKey: object.nomeAzienda == null
              ? null
              : RichTextDTOFixture.factory()
                  .makeJsonObjectFromSingle(object.nomeAzienda!),
          K.statoDiPubblicazioneKey: object.statoDiPubblicazione == null
              ? null
              : RichTextDTOFixture.factory()
                  .makeJsonObjectFromSingle(object.statoDiPubblicazione!),
          K.urlSitoWeb: {
            "id": "baf99b63-2636-40e3-8fd6-a113b1afa166",
            "type": "url",
            "url": null,
          },
          K.tempisticeKey: object.tempistiche == null
              ? null
              : RichTextDTOFixture.factory()
                  .makeJsonObjectFromSingle(object.tempistiche!),
          K.richiestaDiLavoroKey: object.richiestaDiLavoro == null
              ? null
              : RichTextDTOFixture.factory()
                  .makeJsonObjectFromSingle(object.richiestaDiLavoro!),
          K.budgetKey: object.budget == null
              ? null
              : RichTextDTOFixture.factory()
                  .makeJsonObjectFromSingle(object.budget!),
          K.ndaKey: object.nda == null
              ? null
              : SelectDTOFixture.factory(["Sì", "No"])
                  .makeJsonObjectFromSingle(object.nda!),
          K.codiceKey: object.codice == null
              ? null
              : TitleDTOFixture.factory()
                  .makeJsonObjectFromSingle(object.codice!),
          K.tempisticheDiPagamentoKey: object.tempisticheDiPagamento == null
              ? null
              : RichTextDTOFixture.factory()
                  .makeJsonObjectFromSingle(object.tempisticheDiPagamento!),
          K.descrizioneDelProgettoKey: object.descrizioneDelProgetto == null
              ? null
              : RichTextDTOFixture.factory()
                  .makeJsonObjectFromSingle(object.descrizioneDelProgetto!),
          K.tipoDiRelazioneKey: object.tipoDiRelazione == null
              ? null
              : SelectDTOFixture.factory([
                  "Con altri professionisti",
                  "Solo con chi commissiona il lavoro",
                ]).makeJsonObjectFromSingle(object.tipoDiRelazione!),
        },
      );
}

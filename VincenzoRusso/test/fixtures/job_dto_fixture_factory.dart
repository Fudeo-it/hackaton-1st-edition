import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:offertelavoroflutter_app/services/network/dto/generic_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/icon_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/job_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/parent_dto.dart';

import 'properties_dto_fixture_factory.dart';

extension JobDTOFixture on JobDTO {
  static JobDTOFixtureFactory factory() => JobDTOFixtureFactory();
}

class JobDTOFixtureFactory extends JsonFixtureFactory<JobDTO> {
  @override
  FixtureDefinition<JobDTO> definition() => define(
        (faker) => JobDTO(
          object: "page",
          id: faker.randomGenerator.fromCharSet(
            "88f0ff7e-ce1e-4c9d-a60a-0f8155f6a452",
            "88f0ff7e-ce1e-4c9d-a60a-0f8155f6a452".length,
          ),
          createdTime: "2023-02-03T09:03:00.000Z",
          lastEditedTime: "2023-02-03T09:03:00.000Z",
          createdBy: GenericDTO(
            object: "user",
            id: "ea75381d-c398-47ec-bc4c-95fef2f2f931",
          ),
          lastEditedBy: GenericDTO(
            object: "user",
            id: "ea75381d-c398-47ec-bc4c-95fef2f2f931",
          ),
          cover: null,
          icon: IconDTO(
            type: "emoji",
            emoji: "👨‍💻",
          ),
          parent: ParentDTO(
            type: "database_id",
            databaseId: "283d2760-f815-48f0-a7ba-ca4b3e58d7d8",
          ),
          properties: PropertiesDTOFixture.factory().makeSingle(),
          archived: false,
          url: faker.internet.httpsUrl(),
        ),
      );

  @override
  JsonFixtureDefinition<JobDTO> jsonDefinition() => defineJson(
        (object) => {
          K.objectKey: object.object,
          K.idKey: object.id,
          K.createdTimeKey: object.createdTime,
          K.lastEditedTimeKey: object.lastEditedTime,
          K.createdByKey: object.createdBy?.toJson(),
          K.lastEditedByKey: object.lastEditedBy?.toJson(),
          K.coverKey: object.cover,
          K.iconKey: object.icon?.toJson(),
          K.parentKey: object.parent?.toJson(),
          K.archivedKey: object.archived,
          K.propertiesKey:
              PropertiesDTOFixture.factory().makeJsonObjectFromSingle(
            object.properties ?? PropertiesDTOFixture.factory().makeSingle(),
          ),
          K.urlKey: object.url,
        },
      );
}

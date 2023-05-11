import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:offertelavoroflutter_app/models/enum/contract_type.dart';
import 'package:offertelavoroflutter_app/models/enum/seniority.dart';
import 'package:offertelavoroflutter_app/models/enum/team_location.dart';
import 'package:offertelavoroflutter_app/models/job.dart' as model;

extension JobFixture on model.Job {
  static JobFixtureFactory factory() => JobFixtureFactory();
}

class JobFixtureFactory extends FixtureFactory<model.Job> {
  @override
  FixtureDefinition<model.Job> definition() => define(
        (faker) => model.Job(
          id: faker.randomGenerator.fromCharSet(
            "88f0ff7e-ce1e-4c9d-a60a-0f8155f6a452",
            "88f0ff7e-ce1e-4c9d-a60a-0f8155f6a452".length,
          ),
          emoji: "🧑🏻‍💻",
          archived: false,
          jobPosted: DateTime.now(),
          team:
              faker.randomGenerator.element<TeamLocation>(TeamLocation.values),
          contract:
              faker.randomGenerator.element<ContractType>(ContractType.values),
          seniority: faker.randomGenerator.element<Seniority>(Seniority.values),
          title: faker.lorem.sentence(),
          qualification: faker.company.position(),
          ral: faker.lorem.word(),
          description: faker.lorem.sentences(4),
          toApply: faker.lorem.sentence(),
          location: faker.address.city(),
          company: faker.company.name(),
          publicationStatus: faker.lorem.sentence(),
          website: faker.internet.httpsUrl(),
        ),
      );
}

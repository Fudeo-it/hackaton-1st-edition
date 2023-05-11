import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:offertelavoroflutter_app/models/enum/relationship.dart';
import 'package:offertelavoroflutter_app/models/job_freelance.dart';

extension JobFreelanceFixture on JobFreelance {
  static JobFreelanceFixtureFactory factory() => JobFreelanceFixtureFactory();
}

class JobFreelanceFixtureFactory extends FixtureFactory<JobFreelance> {
  @override
  FixtureDefinition<JobFreelance> definition() => define(
        (faker) => JobFreelance(
          id: faker.randomGenerator.fromCharSet(
            "88f0ff7e-ce1e-4c9d-a60a-0f8155f6a452",
            "88f0ff7e-ce1e-4c9d-a60a-0f8155f6a452".length,
          ),
          emoji: "🧑🏻‍💻",
          archived: false,
          jobPosted: DateTime.now(),
          description: faker.lorem.sentences(4),
          toApply: faker.lorem.sentence(),
          budget: faker.lorem.sentence(),
          code: faker.lorem.sentence(),
          jobApplication: faker.lorem.sentences(4),
          paymentTiming: faker.lorem.sentence(),
          timelines: faker.lorem.sentence(),
          nda: faker.randomGenerator.boolean(),
          relationship:
              faker.randomGenerator.element<Relationship>(Relationship.values),
        ),
      );
}

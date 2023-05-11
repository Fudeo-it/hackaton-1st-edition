import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:offertelavoroflutter_app/models/enum/job_type.dart';
import 'package:offertelavoroflutter_app/models/favourite_job.dart';
import 'package:offertelavoroflutter_app/models/job.dart' as model;

extension FavouriteJobFixture on FavouriteJob {
  static FavouriteJobFixtureFactory factory({model.Job? job}) =>
      FavouriteJobFixtureFactory(myJob: job);
}

class FavouriteJobFixtureFactory extends FixtureFactory<FavouriteJob> {
  model.Job? myJob;
  FavouriteJobFixtureFactory({this.myJob});

  @override
  FixtureDefinition<FavouriteJob> definition() => define(
        (faker) {
          if (myJob != null) {
            return FavouriteJob(
              id: myJob!.id,
              company: myJob!.company,
              position: myJob!.qualification,
              emoji: myJob!.emoji,
              jobType: JobType.office,
            );
          }

          return FavouriteJob(
            id: faker.randomGenerator.fromCharSet(
              "88f0ff7e-ce1e-4c9d-a60a-0f8155f6a452",
              "88f0ff7e-ce1e-4c9d-a60a-0f8155f6a452".length,
            ),
            company: faker.company.name(),
            position: faker.company.position(),
            emoji: faker.randomGenerator.element(["😛", "🤑"]),
            jobType: JobType.office,
          );
        },
      );
}

import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:offertelavoroflutter_app/models/favourite_job.dart';
import 'package:offertelavoroflutter_app/repositories/favourite_repository.dart';

import '../fixtures/favourite_job_fixture_factory.dart';

void main() {
  late FavouriteRepository repository;

  late List<FavouriteJob> firstList;
  late FavouriteJob favouriteJob;

  setUp(() {
    repository = FavouriteRepository();

    firstList = FavouriteJobFixture.factory().makeMany(3);
    favouriteJob = FavouriteJobFixture.factory().makeSingle();
  });

  group(
    "add remove and set list of favourite",
    () {
      test(
        "add favourite at list",
        () {
          final newList = [favouriteJob];

          final actual = repository.addFavourite(favouriteJob);

          expect(actual, newList);
          expect(actual.length, 1);
        },
      );

      test(
        "remove favoirite at list",
        () {
          repository.addFavourite(favouriteJob);

          final actual = repository.removeFavourite(favouriteJob);

          expect(actual, []);
        },
      );
    },
  );
}

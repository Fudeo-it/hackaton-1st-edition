import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:offertelavoroflutter_app/blocs/favourite_job_bloc/favourite_job_bloc.dart';
import 'package:offertelavoroflutter_app/models/favourite_job.dart';
import 'package:offertelavoroflutter_app/repositories/favourite_repository.dart';

import '../fixtures/favourite_job_fixture_factory.dart';
import 'favourite_job_bloc_test.mocks.dart';

@GenerateMocks([
  Storage,
  FavouriteRepository,
])
void main() {
  late MockStorage storage;
  late MockFavouriteRepository favouriteRepository;

  late List<FavouriteJob> favouriteList;
  late List<FavouriteJob> newList;
  late FavouriteJob favouriteJob;

  setUp(() {
    storage = MockStorage();
    favouriteRepository = MockFavouriteRepository();
  });

  group(
    "test add favourite",
    () {
      blocTest(
        "add favourite successfully",
        setUp: () {
          favouriteList = FavouriteJobFixture.factory().makeMany(3);

          favouriteJob = FavouriteJobFixture.factory().makeSingle();

          HydratedBloc.storage = storage;
          newList = [...favouriteList, favouriteJob];

          when(favouriteRepository.addFavourite(favouriteJob))
              .thenAnswer((_) => newList);
        },
        build: () => FavouriteJobBloc(favouriteRepository),
        act: (bloc) => bloc.addFavourite(favouriteJob),
        expect: () => [
          const LoadingFavouriteJobState(),
          LoadedFavouriteJobState(newList),
        ],
        verify: (bloc) =>
            verify(favouriteRepository.addFavourite(favouriteJob)).called(1),
      );
    },
  );

  group(
    "test remove favourite",
    () {
      blocTest(
        "remove favourite successfully",
        setUp: () {
          favouriteList = FavouriteJobFixture.factory().makeMany(3);

          favouriteJob = favouriteList.last;

          newList = List.from(favouriteList);
          newList.removeLast();

          HydratedBloc.storage = storage;

          when(favouriteRepository.removeFavourite(favouriteJob))
              .thenAnswer((_) => newList);
        },
        build: () => FavouriteJobBloc(favouriteRepository),
        act: (bloc) => bloc.removeFavourite(favouriteJob),
        expect: () => [
          const LoadingFavouriteJobState(),
          LoadedFavouriteJobState(newList),
        ],
        verify: (bloc) =>
            verify(favouriteRepository.removeFavourite(favouriteJob)).called(1),
      );

      blocTest(
        "remove favourite with no favourite successfully",
        setUp: () {
          favouriteList = FavouriteJobFixture.factory().makeMany(1);

          favouriteJob = favouriteList.last;

          newList = [];

          HydratedBloc.storage = storage;

          when(favouriteRepository.removeFavourite(favouriteJob))
              .thenAnswer((_) => newList);
        },
        build: () => FavouriteJobBloc(favouriteRepository),
        act: (bloc) => bloc.removeFavourite(favouriteJob),
        expect: () => [
          const LoadingFavouriteJobState(),
          const NoFavouriteJobState(),
        ],
        verify: (bloc) =>
            verify(favouriteRepository.removeFavourite(favouriteJob)).called(1),
      );
    },
  );
}

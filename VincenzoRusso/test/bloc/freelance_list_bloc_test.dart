import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:offertelavoroflutter_app/blocs/freelance_list_bloc/freelance_list_bloc.dart';
import 'package:offertelavoroflutter_app/models/filters.dart';
import 'package:offertelavoroflutter_app/models/job_freelance.dart';
import 'package:offertelavoroflutter_app/models/sorts.dart';
import 'package:offertelavoroflutter_app/repositories/job_repository.dart';
import '../fixtures/job_freelance_fixture_factory.dart';
import 'job_list_bloc_test.mocks.dart';

@GenerateMocks([JobRepository])
void main() {
  late MockJobRepository jobRepository;

  late Filters filter;
  late Sorts sorts;
  late List<JobFreelance> jobs;

  setUp(() {
    jobRepository = MockJobRepository();
  });

  group(
    "test fetch job freelance list",
    () {
      blocTest(
        "fetch first list of freelance jobs successfully",
        setUp: () {
          filter = const Filters();
          sorts = const Sorts();

          jobs = JobFreelanceFixture.factory().makeMany(3);

          when(jobRepository.firstListFreelance(
            filters: filter,
            sorts: sorts,
          )).thenAnswer((_) async => jobs);

          when(jobRepository.hasMoreFreelance).thenReturn(false);
          when(jobRepository.filterFreelance).thenReturn(filter);
          when(jobRepository.sortsFreelance).thenReturn(sorts);
        },
        build: () => FreelanceListBloc(jobRepository: jobRepository),
        act: (bloc) => bloc.fetchFreelance(
          filters: filter,
          sorts: sorts,
        ),
        expect: () => [
          const FetchingFreelanceListState(),
          FetchedFreelanceListState(
            freelanceJobs: jobs,
            hasMore: false,
            filters: filter,
            sorts: sorts,
          ),
        ],
        verify: (_) => verify(jobRepository.firstListFreelance(
          filters: filter,
          sorts: sorts,
        )).called(1),
      );

      blocTest(
        "fetch first list of freelance jobs with no jobs successfully",
        setUp: () {
          filter = const Filters();
          sorts = const Sorts();

          jobs = [];

          when(jobRepository.firstListFreelance(
            filters: filter,
            sorts: sorts,
          )).thenAnswer((_) async => jobs);

          when(jobRepository.hasMoreFreelance).thenReturn(false);
          when(jobRepository.filterFreelance).thenReturn(filter);
          when(jobRepository.sortsFreelance).thenReturn(sorts);
        },
        build: () => FreelanceListBloc(jobRepository: jobRepository),
        act: (bloc) => bloc.fetchFreelance(
          filters: filter,
          sorts: sorts,
        ),
        expect: () => [
          const FetchingFreelanceListState(),
          const NoFreelanceListState(),
        ],
        verify: (_) => verify(jobRepository.firstListFreelance(
          filters: filter,
          sorts: sorts,
        )).called(1),
      );

      blocTest(
        "fetch first list of freelance jobs with unexpected error",
        setUp: () {
          filter = const Filters();
          sorts = const Sorts();

          jobs = [];

          when(jobRepository.firstListFreelance(
            filters: filter,
            sorts: sorts,
          )).thenThrow(Error());

          when(jobRepository.hasMoreFreelance).thenReturn(false);
          when(jobRepository.filterFreelance).thenReturn(filter);
          when(jobRepository.sortsFreelance).thenReturn(sorts);
        },
        build: () => FreelanceListBloc(jobRepository: jobRepository),
        act: (bloc) => bloc.fetchFreelance(
          filters: filter,
          sorts: sorts,
        ),
        expect: () => [
          const FetchingFreelanceListState(),
          const ErrorFreelanceListState(),
        ],
        verify: (_) => verify(jobRepository.firstListFreelance(
          filters: filter,
          sorts: sorts,
        )).called(1),
      );
    },
  );

  group(
    "test fetch more freelance job list",
    () {
      blocTest(
        "fetch more jobs in the list successfully",
        setUp: () {
          filter = const Filters();
          sorts = const Sorts();

          jobs = JobFreelanceFixture.factory().makeMany(3);

          when(jobRepository.fetchAnotherFreelance)
              .thenAnswer((_) async => jobs);

          when(jobRepository.hasMoreFreelance).thenReturn(false);
          when(jobRepository.filterFreelance).thenReturn(filter);
          when(jobRepository.sortsFreelance).thenReturn(sorts);
        },
        build: () => FreelanceListBloc(jobRepository: jobRepository),
        act: (bloc) => bloc.fetchMoreFreelance(),
        expect: () => [
          FetchedFreelanceListState(
            freelanceJobs: jobs,
            hasMore: false,
            filters: filter,
            sorts: sorts,
          ),
        ],
        verify: (_) => verify(jobRepository.fetchAnotherFreelance).called(1),
      );

      blocTest(
        "fetch more freelance jobs in the list with unexpected error",
        setUp: () {
          filter = const Filters();
          sorts = const Sorts();

          jobs = [];

          when(jobRepository.fetchAnotherFreelance).thenThrow(Error());

          when(jobRepository.hasMoreFreelance).thenReturn(false);
          when(jobRepository.filterFreelance).thenReturn(filter);
          when(jobRepository.sortsFreelance).thenReturn(sorts);
        },
        build: () => FreelanceListBloc(jobRepository: jobRepository),
        act: (bloc) => bloc.fetchMoreFreelance(),
        expect: () => [
          const ErrorFreelanceListState(),
        ],
        verify: (_) => verify(jobRepository.fetchAnotherFreelance).called(1),
      );
    },
  );
}

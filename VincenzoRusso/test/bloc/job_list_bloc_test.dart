import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:offertelavoroflutter_app/blocs/job_list_bloc/job_list_bloc.dart';
import 'package:offertelavoroflutter_app/models/filters.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/models/sorts.dart';
import 'package:offertelavoroflutter_app/repositories/job_repository.dart';
import '../fixtures/job_fixture_factory.dart';
import 'job_list_bloc_test.mocks.dart';

@GenerateMocks([JobRepository])
void main() {
  late MockJobRepository jobRepository;

  late Filters filter;
  late Sorts sorts;
  late List<Job> jobs;

  setUp(() {
    jobRepository = MockJobRepository();
  });

  group(
    "test fetch job list",
    () {
      blocTest(
        "fetch first lits of jobs successfully",
        setUp: () {
          filter = const Filters();
          sorts = const Sorts();

          jobs = JobFixture.factory().makeMany(3);

          when(jobRepository.firstListJobs(
            filters: filter,
            sorts: sorts,
          )).thenAnswer((_) async => jobs);

          when(jobRepository.hasMoreJob).thenReturn(false);
          when(jobRepository.filterJob).thenReturn(filter);
          when(jobRepository.sortsJob).thenReturn(sorts);
        },
        build: () => JobListBloc(jobRepository: jobRepository),
        act: (bloc) => bloc.fetchFirstPageJobs(
          filters: filter,
          sorts: sorts,
        ),
        expect: () => [
          const FetchingJobListState(),
          FetchedJobListState(
            jobs: jobs,
            hasMore: false,
            filters: filter,
            sorts: sorts,
          ),
        ],
        verify: (_) => verify(jobRepository.firstListJobs(
          filters: filter,
          sorts: sorts,
        )).called(1),
      );

      blocTest(
        "fetch first lits of jobs with no jobs successfully",
        setUp: () {
          filter = const Filters();
          sorts = const Sorts();

          jobs = [];

          when(jobRepository.firstListJobs(
            filters: filter,
            sorts: sorts,
          )).thenAnswer((_) async => jobs);

          when(jobRepository.hasMoreJob).thenReturn(false);
          when(jobRepository.filterJob).thenReturn(filter);
          when(jobRepository.sortsJob).thenReturn(sorts);
        },
        build: () => JobListBloc(jobRepository: jobRepository),
        act: (bloc) => bloc.fetchFirstPageJobs(
          filters: filter,
          sorts: sorts,
        ),
        expect: () => [
          const FetchingJobListState(),
          const NoJobListState(),
        ],
        verify: (_) => verify(jobRepository.firstListJobs(
          filters: filter,
          sorts: sorts,
        )).called(1),
      );

      blocTest(
        "fetch first lits of jobs with unexpected error",
        setUp: () {
          filter = const Filters();
          sorts = const Sorts();

          jobs = [];

          when(jobRepository.firstListJobs(
            filters: filter,
            sorts: sorts,
          )).thenThrow(Error());

          when(jobRepository.hasMoreJob).thenReturn(false);
          when(jobRepository.filterJob).thenReturn(filter);
          when(jobRepository.sortsJob).thenReturn(sorts);
        },
        build: () => JobListBloc(jobRepository: jobRepository),
        act: (bloc) => bloc.fetchFirstPageJobs(
          filters: filter,
          sorts: sorts,
        ),
        expect: () => [
          const FetchingJobListState(),
          const ErrorJobListState(),
        ],
        verify: (_) => verify(jobRepository.firstListJobs(
          filters: filter,
          sorts: sorts,
        )).called(1),
      );
    },
  );

  group(
    "test fetch more job list",
    () {
      blocTest(
        "fetch more jobs in the list successfully",
        setUp: () {
          filter = const Filters();
          sorts = const Sorts();

          jobs = JobFixture.factory().makeMany(3);

          when(jobRepository.fetchAnotherJobs).thenAnswer((_) async => jobs);

          when(jobRepository.hasMoreJob).thenReturn(false);
          when(jobRepository.filterJob).thenReturn(filter);
          when(jobRepository.sortsJob).thenReturn(sorts);
        },
        build: () => JobListBloc(jobRepository: jobRepository),
        act: (bloc) => bloc.fetchMoreJobs(),
        expect: () => [
          FetchedJobListState(
            jobs: jobs,
            hasMore: false,
            filters: filter,
            sorts: sorts,
          ),
        ],
        verify: (_) => verify(jobRepository.fetchAnotherJobs).called(1),
      );

      blocTest(
        "fetch fetch more jobs in the list with unexpected error",
        setUp: () {
          filter = const Filters();
          sorts = const Sorts();

          jobs = [];

          when(jobRepository.fetchAnotherJobs).thenThrow(Error());

          when(jobRepository.hasMoreJob).thenReturn(false);
          when(jobRepository.filterJob).thenReturn(filter);
          when(jobRepository.sortsJob).thenReturn(sorts);
        },
        build: () => JobListBloc(jobRepository: jobRepository),
        act: (bloc) => bloc.fetchMoreJobs(),
        expect: () => [
          const ErrorJobListState(),
        ],
        verify: (_) => verify(jobRepository.fetchAnotherJobs).called(1),
      );
    },
  );
}

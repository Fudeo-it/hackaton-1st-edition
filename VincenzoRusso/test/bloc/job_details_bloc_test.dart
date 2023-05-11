import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:offertelavoroflutter_app/blocs/job_details_bloc/job_details_bloc.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/models/job_freelance.dart';
import 'package:offertelavoroflutter_app/repositories/job_repository.dart';

import '../fixtures/job_fixture_factory.dart';
import '../fixtures/job_freelance_fixture_factory.dart';
import 'job_list_bloc_test.mocks.dart';

@GenerateMocks([JobRepository])
void main() {
  late MockJobRepository jobRepository;

  late Job job;
  late JobFreelance freelance;
  late String id;

  setUp(() {
    jobRepository = MockJobRepository();
  });

  group(
    "test get job details",
    () {
      blocTest(
        "fetch job by id successfully",
        setUp: () {
          job = JobFixture.factory().makeSingle();
          id = "hgfd-34";

          when(jobRepository.jobByID(id)).thenAnswer((_) async => job);
        },
        build: () => JobDetailsBloc(jobRepository),
        act: (bloc) => bloc.fetchJob(id),
        expect: () => [
          const FetchingJobDetailsState(),
          FetchedJobDetailsState(job),
        ],
        verify: (bloc) => verify(jobRepository.jobByID(id)).called(1),
      );

      blocTest(
        "fetch job by id with unexpected error",
        setUp: () {
          job = JobFixture.factory().makeSingle();
          id = "hgfd-34";

          when(jobRepository.jobByID(id)).thenThrow(Error());
        },
        build: () => JobDetailsBloc(jobRepository),
        act: (bloc) => bloc.fetchJob(id),
        expect: () => [
          const FetchingJobDetailsState(),
          const ErrorJobDetailsState(),
        ],
        verify: (bloc) => verify(jobRepository.jobByID(id)).called(1),
      );
    },
  );

  group(
    "test get freelance job details",
    () {
      blocTest(
        "fetch freelance job by id successfully",
        setUp: () {
          freelance = JobFreelanceFixture.factory().makeSingle();
          id = "hgfd-34";

          when(jobRepository.freelanceByID(id))
              .thenAnswer((_) async => freelance);
        },
        build: () => JobDetailsBloc(jobRepository),
        act: (bloc) => bloc.fetchJobFreelance(id),
        expect: () => [
          const FetchingJobDetailsState(),
          FetchedJobFreelanceDetailsState(freelance),
        ],
        verify: (bloc) => verify(jobRepository.freelanceByID(id)).called(1),
      );

      blocTest(
        "fetch freelance job by id with unexpected error",
        setUp: () {
          freelance = JobFreelanceFixture.factory().makeSingle();
          id = "hgfd-34";

          when(jobRepository.freelanceByID(id)).thenThrow(Error());
        },
        build: () => JobDetailsBloc(jobRepository),
        act: (bloc) => bloc.fetchJobFreelance(id),
        expect: () => [
          const FetchingJobDetailsState(),
          const ErrorJobDetailsState(),
        ],
        verify: (bloc) => verify(jobRepository.freelanceByID(id)).called(1),
      );
    },
  );
}

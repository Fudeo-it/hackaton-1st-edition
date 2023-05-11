import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:offertelavoroflutter_app/models/enum/contract_type.dart';
import 'package:offertelavoroflutter_app/models/enum/relationship.dart';
import 'package:offertelavoroflutter_app/models/enum/seniority.dart';
import 'package:offertelavoroflutter_app/models/enum/team_location.dart';
import 'package:offertelavoroflutter_app/models/filters.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/models/job_freelance.dart';
import 'package:offertelavoroflutter_app/models/sorts.dart';
import 'package:offertelavoroflutter_app/repositories/job_repository.dart';
import 'package:offertelavoroflutter_app/repositories/mapper/filters_mapper.dart';
import 'package:offertelavoroflutter_app/repositories/mapper/freelance_mapper.dart';
import 'package:offertelavoroflutter_app/repositories/mapper/job_mapper.dart';
import 'package:offertelavoroflutter_app/repositories/mapper/sorts_mapper.dart';
import 'package:offertelavoroflutter_app/services/network/dto/filter_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/notion_response.dart';
import 'package:offertelavoroflutter_app/services/network/dto/query_notion_request.dart';
import 'package:offertelavoroflutter_app/services/network/dto/sort_dto.dart';
import 'package:offertelavoroflutter_app/services/network/job_service.dart';
import '../fixtures/notion_response_fixture_factory.dart';
import 'job_repository_test.mocks.dart';

@GenerateMocks([
  JobService,
  JobMapper,
  FiltersMapper,
  SortsMapper,
  FreelanceMapper,
  Logger,
])
void main() {
  late MockJobService jobService;
  late MockJobMapper jobMapper;
  late MockFiltersMapper filtersMapper;
  late MockSortsMapper sortsMapper;
  late MockFreelanceMapper freelanceMapper;
  late MockLogger logger;

  late JobRepository jobRepository;

  late Filters filters;
  late Sorts sorts;
  late FiltersDTO filtersDTO;
  late SortsDTO sortsDTO;

  late NotionResponse notionResponse;

  late NotionResponse notionResponseFirst;

  setUp(() {
    jobService = MockJobService();
    jobMapper = MockJobMapper();
    filtersMapper = MockFiltersMapper();
    sortsMapper = MockSortsMapper();
    freelanceMapper = MockFreelanceMapper();
    logger = MockLogger();

    jobRepository = JobRepository(
      jobService: jobService,
      jobMapper: jobMapper,
      freelanceMapper: freelanceMapper,
      logger: logger,
      filtersMapper: filtersMapper,
      sortsMapper: sortsMapper,
    );

    notionResponse = NotionResponseFixture.factory().makeSingle();

    notionResponseFirst = NotionResponseFixture.factory(true).makeSingle();
  });

  group(
    "get first list of jobs",
    () {
      test(
        "get first list of jobs successfully",
        () async {
          List<Job> jobs = [];
          filters = const Filters();
          sorts = const Sorts();

          filtersDTO = const FiltersDTO();
          sortsDTO = const SortsDTO();

          when(
            filtersMapper.toDTO(filters),
          ).thenReturn(
            filtersDTO,
          );

          when(
            sortsMapper.toDTO(sorts),
          ).thenReturn(
            sortsDTO,
          );

          final queryRequest = QueryNotionRequest(
            filters: filtersDTO,
            sorts: sortsDTO,
          );

          when(
            jobService.fetchJobList(
              queryRequest,
            ),
          ).thenAnswer(
            (_) async => notionResponse,
          );

          for (var fixture in notionResponse.results) {
            final job = Job(
              id: fixture.id ?? '',
              emoji: fixture.icon?.emoji ?? '',
              archived: fixture.archived ?? false,
              jobPosted: fixture.properties?.jobPosted?.createdTime != null
                  ? DateTime.tryParse(
                          fixture.properties!.jobPosted!.createdTime) ??
                      DateTime.fromMillisecondsSinceEpoch(0)
                  : DateTime.fromMillisecondsSinceEpoch(0),
              team: TeamLocation.values.firstWhere((team) =>
                  team.getString ==
                  (fixture.properties?.team?.select?.name ??
                      "Non disponibile")),
              contract: ContractType.values.firstWhere((contract) =>
                  contract.getString ==
                  (fixture.properties?.contratto?.select?.name ??
                      "Non disponibile")),
              seniority: Seniority.values.firstWhere((seniority) =>
                  seniority.getString ==
                  (fixture.properties?.seniority?.select?.name ??
                      "Non disponibile")),
              title: (fixture.properties?.name?.title
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(' '),
              qualification: (fixture.properties?.qualifica?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              ral: (fixture.properties?.retribuzione?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              description: fixture.properties?.descrizioneOfferta?.richText
                      .map((e) => e.plainText ?? '')
                      .toList(growable: false) ??
                  [],
              toApply: (fixture.properties?.comeCandidarsi?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              location: (fixture.properties?.localita?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              company: (fixture.properties?.nomeAzienda?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              publicationStatus: (fixture
                          .properties?.statoDiPubblicazione?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              website: fixture.properties?.urlSitoWeb?.url ?? '',
            );

            when(jobMapper.fromDTO(fixture)).thenReturn(job);

            jobs.add(job);
          }

          final actual = await jobRepository.firstListJobs(
            filters: filters,
            sorts: sorts,
          );

          expect(actual, jobs);
          verify(jobService.fetchJobList(queryRequest)).called(1);
          verify(filtersMapper.toDTO(filters)).called(1);
          verify(sortsMapper.toDTO(sorts)).called(1);
          verify(jobMapper.fromDTO(any)).called(notionResponse.results.length);
        },
      );

      test(
        "get first list of jobs with service error",
        () async {
          filters = const Filters();
          sorts = const Sorts();

          filtersDTO = const FiltersDTO();
          sortsDTO = const SortsDTO();

          when(
            filtersMapper.toDTO(filters),
          ).thenReturn(
            filtersDTO,
          );

          when(
            sortsMapper.toDTO(sorts),
          ).thenReturn(
            sortsDTO,
          );

          final queryRequest = QueryNotionRequest(
            filters: filtersDTO,
            sorts: sortsDTO,
          );

          when(jobService.fetchJobList(queryRequest)).thenThrow(Error());

          try {
            await jobRepository.firstListJobs(filters: filters, sorts: sorts);
            expect(true, isFalse, reason: "expecting an exception");
          } catch (error) {
            expect(error, isInstanceOf<Error>());
          }

          verify(jobService.fetchJobList(queryRequest)).called(1);
          verify(filtersMapper.toDTO(filters)).called(1);
          verify(sortsMapper.toDTO(sorts)).called(1);
          verifyNever(jobMapper.fromDTO(any));
        },
      );
    },
  );

  group(
    "get first list of freelance jobs",
    () {
      test(
        "get first list of freelance jobs successfully",
        () async {
          List<JobFreelance> jobs = [];
          filters = const Filters();
          sorts = const Sorts();

          filtersDTO = const FiltersDTO();
          sortsDTO = const SortsDTO();

          when(
            filtersMapper.toDTO(filters),
          ).thenReturn(
            filtersDTO,
          );

          when(
            sortsMapper.toDTO(sorts),
          ).thenReturn(
            sortsDTO,
          );

          final queryRequest = QueryNotionRequest(
            filters: filtersDTO,
            sorts: sortsDTO,
          );

          when(
            jobService.fetchFreelanceList(queryRequest),
          ).thenAnswer(
            (_) async => notionResponse,
          );

          for (var fixture in notionResponse.results) {
            final job = JobFreelance(
              id: fixture.id ?? '',
              emoji: fixture.icon?.emoji ?? '',
              archived: fixture.archived ?? false,
              jobPosted: fixture.properties?.jobPosted?.createdTime != null
                  ? DateTime.tryParse(
                          fixture.properties!.jobPosted!.createdTime) ??
                      DateTime.fromMillisecondsSinceEpoch(0)
                  : DateTime.fromMillisecondsSinceEpoch(0),
              timelines: (fixture.properties?.tempistiche?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              toApply: (fixture.properties?.comeCandidarsi?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              jobApplication: fixture.properties?.richiestaDiLavoro?.richText
                      .map((e) => e.plainText ?? '')
                      .toList(growable: false) ??
                  [],
              budget: (fixture.properties?.budget?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              nda: (fixture.properties?.nda?.select?.name ?? 'no')
                          .toLowerCase() ==
                      "no"
                  ? false
                  : true,
              code: (fixture.properties?.codice?.title
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              paymentTiming: (fixture
                          .properties?.tempisticheDiPagamento?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              description: fixture.properties?.descrizioneDelProgetto?.richText
                      .map((e) => e.plainText ?? '')
                      .toList(growable: false) ??
                  [],
              relationship: Relationship.values.firstWhere(
                (relationship) =>
                    relationship.getString ==
                    (fixture.properties?.tipoDiRelazione?.select?.name ??
                        "Non disponibile"),
              ),
            );

            when(freelanceMapper.fromDTO(fixture)).thenReturn(job);

            jobs.add(job);
          }

          final actual = await jobRepository.firstListFreelance(
            filters: filters,
            sorts: sorts,
          );

          expect(actual, jobs);
          verify(jobService.fetchFreelanceList(queryRequest)).called(1);
          verify(filtersMapper.toDTO(filters)).called(1);
          verify(sortsMapper.toDTO(sorts)).called(1);
          verify(freelanceMapper.fromDTO(any))
              .called(notionResponse.results.length);
        },
      );

      test(
        "get first list of jobs with service error",
        () async {
          filters = const Filters();
          sorts = const Sorts();

          filtersDTO = const FiltersDTO();
          sortsDTO = const SortsDTO();

          when(
            filtersMapper.toDTO(filters),
          ).thenReturn(
            filtersDTO,
          );

          when(
            sortsMapper.toDTO(sorts),
          ).thenReturn(
            sortsDTO,
          );

          final queryRequest = QueryNotionRequest(
            filters: filtersDTO,
            sorts: sortsDTO,
          );

          when(jobService.fetchFreelanceList(queryRequest)).thenThrow(Error());

          try {
            await jobRepository.firstListFreelance(
                filters: filters, sorts: sorts);
            expect(true, isFalse, reason: "expecting an exception");
          } catch (error) {
            expect(error, isInstanceOf<Error>());
          }

          verify(jobService.fetchFreelanceList(queryRequest)).called(1);
          verify(filtersMapper.toDTO(filters)).called(1);
          verify(sortsMapper.toDTO(sorts)).called(1);
          verifyNever(jobMapper.fromDTO(any));
        },
      );
    },
  );

  group(
    "get fetch another list of jobs",
    () {
      test(
        "get another list of jobs successfully",
        () async {
          List<Job> jobs = [];
          filters = const Filters();
          sorts = const Sorts();

          filtersDTO = const FiltersDTO();
          sortsDTO = const SortsDTO();

          when(
            filtersMapper.toDTO(filters),
          ).thenReturn(
            filtersDTO,
          );

          when(
            sortsMapper.toDTO(sorts),
          ).thenReturn(
            sortsDTO,
          );

          QueryNotionRequest queryRequest = QueryNotionRequest(
            filters: filtersDTO,
            sorts: sortsDTO,
          );

          when(
            jobService.fetchJobList(
              queryRequest,
            ),
          ).thenAnswer(
            (_) async => notionResponseFirst,
          );

          for (var fixture in notionResponseFirst.results) {
            final job = Job(
              id: fixture.id ?? '',
              emoji: fixture.icon?.emoji ?? '',
              archived: fixture.archived ?? false,
              jobPosted: fixture.properties?.jobPosted?.createdTime != null
                  ? DateTime.tryParse(
                          fixture.properties!.jobPosted!.createdTime) ??
                      DateTime.fromMillisecondsSinceEpoch(0)
                  : DateTime.fromMillisecondsSinceEpoch(0),
              team: TeamLocation.values.firstWhere((team) =>
                  team.getString ==
                  (fixture.properties?.team?.select?.name ??
                      "Non disponibile")),
              contract: ContractType.values.firstWhere((contract) =>
                  contract.getString ==
                  (fixture.properties?.contratto?.select?.name ??
                      "Non disponibile")),
              seniority: Seniority.values.firstWhere((seniority) =>
                  seniority.getString ==
                  (fixture.properties?.seniority?.select?.name ??
                      "Non disponibile")),
              title: (fixture.properties?.name?.title
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(' '),
              qualification: (fixture.properties?.qualifica?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              ral: (fixture.properties?.retribuzione?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              description: fixture.properties?.descrizioneOfferta?.richText
                      .map((e) => e.plainText ?? '')
                      .toList(growable: false) ??
                  [],
              toApply: (fixture.properties?.comeCandidarsi?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              location: (fixture.properties?.localita?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              company: (fixture.properties?.nomeAzienda?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              publicationStatus: (fixture
                          .properties?.statoDiPubblicazione?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              website: fixture.properties?.urlSitoWeb?.url ?? '',
            );

            when(jobMapper.fromDTO(fixture)).thenReturn(job);

            jobs.add(job);
          }

          await jobRepository.firstListJobs(
            filters: filters,
            sorts: sorts,
          );

          final newQuery = QueryNotionRequest(
            startCursor: notionResponseFirst.nextCursor,
            filters: filtersDTO,
            sorts: sortsDTO,
          );

          when(
            jobService.fetchJobList(
              newQuery,
            ),
          ).thenAnswer(
            (_) async => notionResponse,
          );

          for (var fixture in notionResponse.results) {
            final job = Job(
              id: fixture.id ?? '',
              emoji: fixture.icon?.emoji ?? '',
              archived: fixture.archived ?? false,
              jobPosted: fixture.properties?.jobPosted?.createdTime != null
                  ? DateTime.tryParse(
                          fixture.properties!.jobPosted!.createdTime) ??
                      DateTime.fromMillisecondsSinceEpoch(0)
                  : DateTime.fromMillisecondsSinceEpoch(0),
              team: TeamLocation.values.firstWhere((team) =>
                  team.getString ==
                  (fixture.properties?.team?.select?.name ??
                      "Non disponibile")),
              contract: ContractType.values.firstWhere((contract) =>
                  contract.getString ==
                  (fixture.properties?.contratto?.select?.name ??
                      "Non disponibile")),
              seniority: Seniority.values.firstWhere((seniority) =>
                  seniority.getString ==
                  (fixture.properties?.seniority?.select?.name ??
                      "Non disponibile")),
              title: (fixture.properties?.name?.title
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(' '),
              qualification: (fixture.properties?.qualifica?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              ral: (fixture.properties?.retribuzione?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              description: fixture.properties?.descrizioneOfferta?.richText
                      .map((e) => e.plainText ?? '')
                      .toList(growable: false) ??
                  [],
              toApply: (fixture.properties?.comeCandidarsi?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              location: (fixture.properties?.localita?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              company: (fixture.properties?.nomeAzienda?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              publicationStatus: (fixture
                          .properties?.statoDiPubblicazione?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              website: fixture.properties?.urlSitoWeb?.url ?? '',
            );

            when(jobMapper.fromDTO(fixture)).thenReturn(job);

            jobs.add(job);
          }

          final actual = await jobRepository.fetchAnotherJobs;

          expect(actual, jobs);
          verify(jobService.fetchJobList(queryRequest)).called(1);
          verify(jobService.fetchJobList(newQuery)).called(1);
          verify(filtersMapper.toDTO(filters)).called(2);
          verify(sortsMapper.toDTO(sorts)).called(2);
          verify(jobMapper.fromDTO(any)).called((notionResponse.results.length +
              notionResponseFirst.results.length));
        },
      );

      test(
        "get another list of jobs with service error",
        () async {
          List<Job> jobs = [];
          filters = const Filters();
          sorts = const Sorts();

          filtersDTO = const FiltersDTO();
          sortsDTO = const SortsDTO();

          when(
            filtersMapper.toDTO(filters),
          ).thenReturn(
            filtersDTO,
          );

          when(
            sortsMapper.toDTO(sorts),
          ).thenReturn(
            sortsDTO,
          );

          final queryRequest = QueryNotionRequest(
            filters: filtersDTO,
            sorts: sortsDTO,
          );

          when(
            jobService.fetchJobList(
              queryRequest,
            ),
          ).thenAnswer(
            (_) async => notionResponseFirst,
          );

          for (var fixture in notionResponseFirst.results) {
            final job = Job(
              id: fixture.id ?? '',
              emoji: fixture.icon?.emoji ?? '',
              archived: fixture.archived ?? false,
              jobPosted: fixture.properties?.jobPosted?.createdTime != null
                  ? DateTime.tryParse(
                          fixture.properties!.jobPosted!.createdTime) ??
                      DateTime.fromMillisecondsSinceEpoch(0)
                  : DateTime.fromMillisecondsSinceEpoch(0),
              team: TeamLocation.values.firstWhere((team) =>
                  team.getString ==
                  (fixture.properties?.team?.select?.name ??
                      "Non disponibile")),
              contract: ContractType.values.firstWhere((contract) =>
                  contract.getString ==
                  (fixture.properties?.contratto?.select?.name ??
                      "Non disponibile")),
              seniority: Seniority.values.firstWhere((seniority) =>
                  seniority.getString ==
                  (fixture.properties?.seniority?.select?.name ??
                      "Non disponibile")),
              title: (fixture.properties?.name?.title
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(' '),
              qualification: (fixture.properties?.qualifica?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              ral: (fixture.properties?.retribuzione?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              description: fixture.properties?.descrizioneOfferta?.richText
                      .map((e) => e.plainText ?? '')
                      .toList(growable: false) ??
                  [],
              toApply: (fixture.properties?.comeCandidarsi?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              location: (fixture.properties?.localita?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              company: (fixture.properties?.nomeAzienda?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              publicationStatus: (fixture
                          .properties?.statoDiPubblicazione?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              website: fixture.properties?.urlSitoWeb?.url ?? '',
            );

            when(jobMapper.fromDTO(fixture)).thenReturn(job);

            jobs.add(job);
          }

          await jobRepository.firstListJobs(
            filters: filters,
            sorts: sorts,
          );

          final newQuery = QueryNotionRequest(
            startCursor: notionResponseFirst.nextCursor,
            filters: filtersDTO,
            sorts: sortsDTO,
          );

          when(
            jobService.fetchJobList(
              newQuery,
            ),
          ).thenThrow(Error());

          try {
            await jobRepository.fetchAnotherJobs;
            expect(true, isFalse, reason: "expecting an exception");
          } catch (error) {
            expect(error, isInstanceOf<Error>());
          }

          expect(jobs.length, notionResponseFirst.results.length);
          verify(jobService.fetchJobList(queryRequest)).called(1);
          verify(jobService.fetchJobList(newQuery)).called(1);
          verify(filtersMapper.toDTO(filters)).called(2);
          verify(sortsMapper.toDTO(sorts)).called(2);
          verify(jobMapper.fromDTO(any))
              .called(notionResponseFirst.results.length);
        },
      );
    },
  );

  group(
    "get fetch another list of freelance jobs",
    () {
      test(
        "get another list of freelance jobs successfully",
        () async {
          List<JobFreelance> jobs = [];
          filters = const Filters();
          sorts = const Sorts();

          filtersDTO = const FiltersDTO();
          sortsDTO = const SortsDTO();

          when(
            filtersMapper.toDTO(filters),
          ).thenReturn(
            filtersDTO,
          );

          when(
            sortsMapper.toDTO(sorts),
          ).thenReturn(
            sortsDTO,
          );

          final queryRequest = QueryNotionRequest(
            filters: filtersDTO,
            sorts: sortsDTO,
          );

          when(
            jobService.fetchFreelanceList(
              queryRequest,
            ),
          ).thenAnswer(
            (_) async => notionResponseFirst,
          );

          for (var fixture in notionResponseFirst.results) {
            final job = JobFreelance(
              id: fixture.id ?? '',
              emoji: fixture.icon?.emoji ?? '',
              archived: fixture.archived ?? false,
              jobPosted: fixture.properties?.jobPosted?.createdTime != null
                  ? DateTime.tryParse(
                          fixture.properties!.jobPosted!.createdTime) ??
                      DateTime.fromMillisecondsSinceEpoch(0)
                  : DateTime.fromMillisecondsSinceEpoch(0),
              timelines: (fixture.properties?.tempistiche?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              toApply: (fixture.properties?.comeCandidarsi?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              jobApplication: fixture.properties?.richiestaDiLavoro?.richText
                      .map((e) => e.plainText ?? '')
                      .toList(growable: false) ??
                  [],
              budget: (fixture.properties?.budget?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              nda: (fixture.properties?.nda?.select?.name ?? 'no')
                          .toLowerCase() ==
                      "no"
                  ? false
                  : true,
              code: (fixture.properties?.codice?.title
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              paymentTiming: (fixture
                          .properties?.tempisticheDiPagamento?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              description: fixture.properties?.descrizioneDelProgetto?.richText
                      .map((e) => e.plainText ?? '')
                      .toList(growable: false) ??
                  [],
              relationship: Relationship.values.firstWhere(
                (relationship) =>
                    relationship.getString ==
                    (fixture.properties?.tipoDiRelazione?.select?.name ??
                        "Non disponibile"),
              ),
            );

            when(freelanceMapper.fromDTO(fixture)).thenReturn(job);

            jobs.add(job);
          }

          await jobRepository.firstListFreelance(
            filters: filters,
            sorts: sorts,
          );

          final newQuery = QueryNotionRequest(
            startCursor: notionResponseFirst.nextCursor,
            filters: filtersDTO,
            sorts: sortsDTO,
          );

          when(
            jobService.fetchFreelanceList(
              newQuery,
            ),
          ).thenAnswer(
            (_) async => notionResponse,
          );

          for (var fixture in notionResponse.results) {
            final job = JobFreelance(
              id: fixture.id ?? '',
              emoji: fixture.icon?.emoji ?? '',
              archived: fixture.archived ?? false,
              jobPosted: fixture.properties?.jobPosted?.createdTime != null
                  ? DateTime.tryParse(
                          fixture.properties!.jobPosted!.createdTime) ??
                      DateTime.fromMillisecondsSinceEpoch(0)
                  : DateTime.fromMillisecondsSinceEpoch(0),
              timelines: (fixture.properties?.tempistiche?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              toApply: (fixture.properties?.comeCandidarsi?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              jobApplication: fixture.properties?.richiestaDiLavoro?.richText
                      .map((e) => e.plainText ?? '')
                      .toList(growable: false) ??
                  [],
              budget: (fixture.properties?.budget?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              nda: (fixture.properties?.nda?.select?.name ?? 'no')
                          .toLowerCase() ==
                      "no"
                  ? false
                  : true,
              code: (fixture.properties?.codice?.title
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              paymentTiming: (fixture
                          .properties?.tempisticheDiPagamento?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              description: fixture.properties?.descrizioneDelProgetto?.richText
                      .map((e) => e.plainText ?? '')
                      .toList(growable: false) ??
                  [],
              relationship: Relationship.values.firstWhere(
                (relationship) =>
                    relationship.getString ==
                    (fixture.properties?.tipoDiRelazione?.select?.name ??
                        "Non disponibile"),
              ),
            );

            when(freelanceMapper.fromDTO(fixture)).thenReturn(job);

            jobs.add(job);
          }

          final actual = await jobRepository.fetchAnotherFreelance;

          expect(actual, jobs);
          verify(jobService.fetchFreelanceList(queryRequest)).called(1);
          verify(jobService.fetchFreelanceList(newQuery)).called(1);
          verify(filtersMapper.toDTO(filters)).called(2);
          verify(sortsMapper.toDTO(sorts)).called(2);
          verify(freelanceMapper.fromDTO(any)).called(
              (notionResponse.results.length +
                  notionResponseFirst.results.length));
        },
      );

      test(
        "get another list of jobs with service error",
        () async {
          List<JobFreelance> jobs = [];
          filters = const Filters();
          sorts = const Sorts();

          filtersDTO = const FiltersDTO();
          sortsDTO = const SortsDTO();

          when(
            filtersMapper.toDTO(filters),
          ).thenReturn(
            filtersDTO,
          );

          when(
            sortsMapper.toDTO(sorts),
          ).thenReturn(
            sortsDTO,
          );

          final queryRequest = QueryNotionRequest(
            filters: filtersDTO,
            sorts: sortsDTO,
          );

          when(
            jobService.fetchFreelanceList(
              queryRequest,
            ),
          ).thenAnswer(
            (_) async => notionResponseFirst,
          );

          for (var fixture in notionResponseFirst.results) {
            final job = JobFreelance(
              id: fixture.id ?? '',
              emoji: fixture.icon?.emoji ?? '',
              archived: fixture.archived ?? false,
              jobPosted: fixture.properties?.jobPosted?.createdTime != null
                  ? DateTime.tryParse(
                          fixture.properties!.jobPosted!.createdTime) ??
                      DateTime.fromMillisecondsSinceEpoch(0)
                  : DateTime.fromMillisecondsSinceEpoch(0),
              timelines: (fixture.properties?.tempistiche?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              toApply: (fixture.properties?.comeCandidarsi?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              jobApplication: fixture.properties?.richiestaDiLavoro?.richText
                      .map((e) => e.plainText ?? '')
                      .toList(growable: false) ??
                  [],
              budget: (fixture.properties?.budget?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              nda: (fixture.properties?.nda?.select?.name ?? 'no')
                          .toLowerCase() ==
                      "no"
                  ? false
                  : true,
              code: (fixture.properties?.codice?.title
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              paymentTiming: (fixture
                          .properties?.tempisticheDiPagamento?.richText
                          .map((e) => e.plainText ?? '')
                          .toList(growable: false) ??
                      [])
                  .join(" "),
              description: fixture.properties?.descrizioneDelProgetto?.richText
                      .map((e) => e.plainText ?? '')
                      .toList(growable: false) ??
                  [],
              relationship: Relationship.values.firstWhere(
                (relationship) =>
                    relationship.getString ==
                    (fixture.properties?.tipoDiRelazione?.select?.name ??
                        "Non disponibile"),
              ),
            );

            when(freelanceMapper.fromDTO(fixture)).thenReturn(job);

            jobs.add(job);
          }

          await jobRepository.firstListFreelance(
            filters: filters,
            sorts: sorts,
          );

          final newQuery = QueryNotionRequest(
            startCursor: notionResponseFirst.nextCursor,
            filters: filtersDTO,
            sorts: sortsDTO,
          );

          when(
            jobService.fetchFreelanceList(
              newQuery,
            ),
          ).thenThrow(Error());

          try {
            await jobRepository.fetchAnotherFreelance;
            expect(true, isFalse, reason: "expecting an exception");
          } catch (error) {
            expect(error, isInstanceOf<Error>());
          }

          expect(jobs.length, notionResponseFirst.results.length);
          verify(jobService.fetchFreelanceList(queryRequest)).called(1);
          verify(jobService.fetchFreelanceList(newQuery)).called(1);
          verify(filtersMapper.toDTO(filters)).called(2);
          verify(sortsMapper.toDTO(sorts)).called(2);
          verify(freelanceMapper.fromDTO(any))
              .called(notionResponseFirst.results.length);
        },
      );
    },
  );
}

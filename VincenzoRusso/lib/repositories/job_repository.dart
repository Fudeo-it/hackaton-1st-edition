import 'package:logger/logger.dart';
import 'package:offertelavoroflutter_app/models/enum/sort_type.dart';
import 'package:offertelavoroflutter_app/models/filters.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/models/job_freelance.dart';
import 'package:offertelavoroflutter_app/models/sorts.dart';
import 'package:offertelavoroflutter_app/repositories/mapper/filters_mapper.dart';
import 'package:offertelavoroflutter_app/repositories/mapper/freelance_mapper.dart';
import 'package:offertelavoroflutter_app/repositories/mapper/job_mapper.dart';
import 'package:offertelavoroflutter_app/repositories/mapper/sorts_mapper.dart';
import 'package:offertelavoroflutter_app/services/network/dto/query_notion_request.dart';
import 'package:offertelavoroflutter_app/services/network/job_service.dart';

class JobRepository {
  final JobService jobService;
  final JobMapper jobMapper;
  final FiltersMapper filtersMapper;
  final SortsMapper sortsMapper;
  final FreelanceMapper freelanceMapper;
  final Logger logger;
  bool _hasMoreJob = false;
  bool _hasMoreFreelance = false;
  List<Job> _jobList = [];
  List<JobFreelance> _freelanceList = [];
  String? _cursorJob;
  String? _cursorFreelance;
  Filters _filtersJob = const Filters();
  Sorts _sortsJob = const Sorts(
    team: SortType.descending,
  );
  Filters _filtersFreelance = const Filters();
  Sorts _sortsFreelance = const Sorts();

  JobRepository({
    required this.jobService,
    required this.jobMapper,
    required this.freelanceMapper,
    required this.logger,
    required this.filtersMapper,
    required this.sortsMapper,
  });

  bool get hasMoreJob => _hasMoreJob;
  bool get hasMoreFreelance => _hasMoreFreelance;
  Filters get filterJob => _filtersJob;
  Sorts get sortsJob => _sortsJob;
  Filters get filterFreelance => _filtersFreelance;
  Sorts get sortsFreelance => _sortsFreelance;

  Future<List<Job>> firstListJobs({
    Filters? filters,
    Sorts? sorts,
  }) async {
    if (filters != null) {
      _filtersJob = filters;
    }

    if (sorts != null) {
      _sortsJob = sorts;
    }

    try {
      final response = await jobService.fetchJobList(
        QueryNotionRequest(
          filters: filtersMapper.toDTO(_filtersJob),
          sorts: sortsMapper.toDTO(_sortsJob),
        ),
      );

      _jobList =
          response.results.map(jobMapper.fromDTO).toList(growable: false);
      _hasMoreJob = response.hasMore ?? false;

      _cursorJob = _hasMoreJob ? response.nextCursor : null;

      return _jobList;
    } catch (e) {
      logger.e("Error get all jobs");

      rethrow;
    }
  }

  Future<List<Job>> get fetchAnotherJobs async {
    try {
      final response = await jobService.fetchJobList(
        QueryNotionRequest(
          startCursor: _cursorJob,
          filters: filtersMapper.toDTO(_filtersJob),
          sorts: sortsMapper.toDTO(_sortsJob),
        ),
      );

      final newList =
          response.results.map(jobMapper.fromDTO).toList(growable: false);

      _jobList = [..._jobList, ...newList];

      _hasMoreJob = response.hasMore ?? false;

      _cursorJob = _hasMoreJob ? response.nextCursor : null;

      return _jobList;
    } catch (e) {
      logger.e("Error get all jobs");

      rethrow;
    }
  }

  Future<List<JobFreelance>> firstListFreelance({
    Filters? filters,
    Sorts? sorts,
  }) async {
    if (filters != null) {
      _filtersFreelance = filters;
    }

    if (sorts != null) {
      _sortsFreelance = sorts;
    }
    try {
      final response = await jobService.fetchFreelanceList(
        QueryNotionRequest(
          filters: filtersMapper.toDTO(_filtersFreelance),
          sorts: sortsMapper.toDTO(_sortsFreelance),
        ),
      );

      _hasMoreFreelance = response.hasMore ?? false;

      _cursorFreelance = _hasMoreFreelance ? response.nextCursor : null;

      _freelanceList =
          response.results.map(freelanceMapper.fromDTO).toList(growable: false);

      return _freelanceList;
    } catch (e) {
      logger.e("Error get all freelance");

      rethrow;
    }
  }

  Future<List<JobFreelance>> get fetchAnotherFreelance async {
    try {
      final response = await jobService.fetchFreelanceList(
        QueryNotionRequest(
          startCursor: _cursorFreelance,
          filters: filtersMapper.toDTO(_filtersFreelance),
          sorts: sortsMapper.toDTO(_sortsFreelance),
        ),
      );

      final newList =
          response.results.map(freelanceMapper.fromDTO).toList(growable: false);

      _freelanceList = [..._freelanceList, ...newList];

      _hasMoreFreelance = response.hasMore ?? false;

      _cursorFreelance = _hasMoreFreelance ? response.nextCursor : null;

      return _freelanceList;
    } catch (e) {
      logger.e("Error get all jobs");

      rethrow;
    }
  }

  Future<Job> jobByID(String id) async {
    try {
      final response = await jobService.jobByID(id);

      return jobMapper.fromDTO(response);
    } catch (e) {
      logger.e("Error get job by id: $id");

      rethrow;
    }
  }

  Future<JobFreelance> freelanceByID(String id) async {
    try {
      final response = await jobService.jobByID(id);

      return freelanceMapper.fromDTO(response);
    } catch (e) {
      logger.e("Error get job by id: $id");

      rethrow;
    }
  }
}

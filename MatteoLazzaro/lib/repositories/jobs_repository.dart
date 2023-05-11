import 'package:offertelavoroflutter/errors/network_error.dart';
import 'package:offertelavoroflutter/errors/repository_error.dart';
import 'package:offertelavoroflutter/models/job.dart';
import 'package:offertelavoroflutter/repositories/mappers/job_mapper.dart';
import 'package:offertelavoroflutter/services/network/jobs_service.dart';

class JobsRepository {
  final JobsService jobsService;
  final JobMapper jobMapper;

  JobsRepository({
    required this.jobsService,
    required this.jobMapper,
  });

  Future<List<Job>> jobs() async {
    try {
      final response = await jobsService.jobs();
      return response.map(jobMapper.toModel).toList(growable: false);
    } on NetworkError catch (e) {
      throw RepositoryError(e.reasonPhrase);
    } catch (e) {
      throw RepositoryError();
    }
  }
}

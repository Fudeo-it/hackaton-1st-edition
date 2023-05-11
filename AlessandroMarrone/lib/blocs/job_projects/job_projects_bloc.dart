import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_it_app/errors/repository_error.dart';
import 'package:offertelavoroflutter_it_app/models/job_project/job_project_model.dart';
import 'package:offertelavoroflutter_it_app/repositories/job_repository.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';

part 'job_projects_event.dart';
part 'job_projects_state.dart';

class JobProjectsBloc extends Bloc<JobProjectsEvent, JobProjectsState> {
  final JobRepository jobRepository;
  JobProjectsBloc({required this.jobRepository})
      : super(JobProjectsFetching()) {
    on<JobProjectsFetchEvent>(_fetchProjects);
  }

  Future<void> _fetchProjects(JobProjectsFetchEvent event, Emitter emit) async {
    emit(JobProjectsFetching());

    try {
      final jobs = await jobRepository.jobsProjects(K.flutterProjectDatabaseId);
      emit(jobs.isEmpty
          ? NoJobProjectsFetched()
          : JobProjectsFetched(jobs: jobs));
    } on RepositoryError catch (e) {
      emit(JobProjectsError(errorMessage: e.errorMessage));
    } catch (e) {
      emit(const JobProjectsError());
    }
  }

  void fetchProjects() => add(JobProjectsFetchEvent());
}

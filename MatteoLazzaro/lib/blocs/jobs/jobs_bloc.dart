import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter/errors/repository_error.dart';
import 'package:offertelavoroflutter/models/job.dart';
import 'package:offertelavoroflutter/repositories/jobs_repository.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final JobsRepository jobsRepository;

  JobsBloc({required this.jobsRepository}) : super(FetchingJobsState()) {
    on<FetchJobsEvent>(_onFetch);
  }

  FutureOr<void> _onFetch(FetchJobsEvent event, Emitter<JobsState> emit) async {
    emit(FetchingJobsState());

    try {
      final jobs = await jobsRepository.jobs();
      emit(jobs.isEmpty ? NoJobsState() : FetchedJobsState(jobs));
    } on RepositoryError catch (error) {
      emit(ErrorJobsState(error.errorMessage));
    } catch (error) {
      emit(const ErrorJobsState());
    }
  }

  void fetchJobs() => add(const FetchJobsEvent());
}

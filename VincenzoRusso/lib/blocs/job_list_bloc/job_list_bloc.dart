import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/models/filters.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/models/sorts.dart';
import 'package:offertelavoroflutter_app/repositories/job_repository.dart';

part 'job_list_event.dart';
part 'job_list_state.dart';

class JobListBloc extends Bloc<JobListEvent, JobListState> {
  final JobRepository jobRepository;

  JobListBloc({required this.jobRepository})
      : super(const FetchingJobListState()) {
    on<FetchJobListEvent>(_onFetchJobListEvent);
    on<FetchMoreJobListEvent>(_onFetchMoreJobListEvent);
  }

  void fetchFirstPageJobs({
    Filters? filters,
    Sorts? sorts,
  }) =>
      add(
        FetchJobListEvent(
          filters: filters,
          sorts: sorts,
        ),
      );
  void fetchMoreJobs() => add(const FetchMoreJobListEvent());

  FutureOr<void> _onFetchJobListEvent(
      FetchJobListEvent event, Emitter<JobListState> emit) async {
    emit(const FetchingJobListState());

    try {
      final List<Job> jobs = await jobRepository.firstListJobs(
        filters: event.filters,
        sorts: event.sorts,
      );

      emit(
        jobs.isNotEmpty
            ? FetchedJobListState(
                jobs: jobs,
                hasMore: jobRepository.hasMoreJob,
                filters: jobRepository.filterJob,
                sorts: jobRepository.sortsJob,
              )
            : const NoJobListState(),
      );
    } catch (e) {
      emit(const ErrorJobListState());
    }
  }

  FutureOr<void> _onFetchMoreJobListEvent(
      FetchMoreJobListEvent event, Emitter<JobListState> emit) async {
    try {
      final List<Job> jobs = await jobRepository.fetchAnotherJobs;

      emit(
        jobs.isNotEmpty
            ? FetchedJobListState(
                jobs: jobs,
                hasMore: jobRepository.hasMoreJob,
                filters: jobRepository.filterJob,
                sorts: jobRepository.sortsJob,
              )
            : const NoJobListState(),
      );
    } catch (e) {
      emit(const ErrorJobListState());
    }
  }
}

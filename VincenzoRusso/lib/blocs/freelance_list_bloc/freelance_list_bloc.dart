import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/models/filters.dart';
import 'package:offertelavoroflutter_app/models/job_freelance.dart';
import 'package:offertelavoroflutter_app/models/sorts.dart';
import 'package:offertelavoroflutter_app/repositories/job_repository.dart';

part 'freelance_list_event.dart';
part 'freelance_list_state.dart';

class FreelanceListBloc extends Bloc<FreelanceListEvent, FreelanceListState> {
  final JobRepository jobRepository;

  FreelanceListBloc({required this.jobRepository})
      : super(const FetchingFreelanceListState()) {
    on<FetchFreelanceListEvent>(_onFetchFreelanceListEvent);
    on<FetchMoreFreelanceListEvent>(_onFetchMoreFreelanceListEvent);
  }

  void fetchFreelance({
    Filters? filters,
    Sorts? sorts,
  }) =>
      add(
        FetchFreelanceListEvent(
          filters: filters,
          sorts: sorts,
        ),
      );

  void fetchMoreFreelance() => add(const FetchMoreFreelanceListEvent());

  FutureOr<void> _onFetchFreelanceListEvent(
      FetchFreelanceListEvent event, Emitter<FreelanceListState> emit) async {
    emit(const FetchingFreelanceListState());

    try {
      final freelanceJobs = await jobRepository.firstListFreelance(
        filters: event.filters,
        sorts: event.sorts,
      );

      emit(
        freelanceJobs.isNotEmpty
            ? FetchedFreelanceListState(
                freelanceJobs: freelanceJobs,
                hasMore: jobRepository.hasMoreFreelance,
                filters: jobRepository.filterFreelance,
                sorts: jobRepository.sortsFreelance,
              )
            : const NoFreelanceListState(),
      );
    } catch (e) {
      emit(const ErrorFreelanceListState());
    }
  }

  FutureOr<void> _onFetchMoreFreelanceListEvent(
      FetchMoreFreelanceListEvent event,
      Emitter<FreelanceListState> emit) async {
    try {
      final List<JobFreelance> jobs = await jobRepository.fetchAnotherFreelance;

      emit(
        jobs.isNotEmpty
            ? FetchedFreelanceListState(
                freelanceJobs: jobs,
                hasMore: jobRepository.hasMoreFreelance,
                filters: jobRepository.filterFreelance,
                sorts: jobRepository.sortsFreelance,
              )
            : const NoFreelanceListState(),
      );
    } catch (e) {
      emit(const ErrorFreelanceListState());
    }
  }
}

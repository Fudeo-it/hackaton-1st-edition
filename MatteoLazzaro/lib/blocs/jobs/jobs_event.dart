part of 'jobs_bloc.dart';

abstract class JobsEvent extends Equatable {
  const JobsEvent();
}

class FetchJobsEvent extends JobsEvent {
  const FetchJobsEvent();

  @override
  List<Object?> get props => [];
}

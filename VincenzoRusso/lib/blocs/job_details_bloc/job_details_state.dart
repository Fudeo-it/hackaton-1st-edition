part of 'job_details_bloc.dart';

abstract class JobDetailsState extends Equatable {
  const JobDetailsState();

  @override
  List<Object> get props => [];
}

class FetchingJobDetailsState extends JobDetailsState {
  const FetchingJobDetailsState();
}

class FetchedJobDetailsState extends JobDetailsState {
  final Job job;

  const FetchedJobDetailsState(this.job);
}

class FetchedJobFreelanceDetailsState extends JobDetailsState {
  final JobFreelance job;

  const FetchedJobFreelanceDetailsState(this.job);
}

class ErrorJobDetailsState extends JobDetailsState {
  const ErrorJobDetailsState();
}

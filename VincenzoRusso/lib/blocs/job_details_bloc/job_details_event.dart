part of 'job_details_bloc.dart';

abstract class JobDetailsEvent extends Equatable {
  const JobDetailsEvent();

  @override
  List<Object> get props => [];
}

class FetchJobDetailsEvent extends JobDetailsEvent {
  final String jobID;

  const FetchJobDetailsEvent(this.jobID);
}

class FetchJobFreelanceDetailsEvent extends JobDetailsEvent {
  final String jobID;

  const FetchJobFreelanceDetailsEvent(this.jobID);
}

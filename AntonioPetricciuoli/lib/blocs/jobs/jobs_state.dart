part of 'jobs_bloc.dart';

enum JobsStatus { initial, loading, success, failure }

class JobsState extends Equatable {
  const JobsState({
    this.status = JobsStatus.loading,
    this.recruitment = const [],
    this.freelance = const [],
  });

  final JobsStatus status;
  final List<Recruitment> recruitment;
  final List<Freelance> freelance;

  JobsState copyWith({
    JobsStatus? status,
    List<Recruitment>? recruitment,
    List<Freelance>? freelance,
  }) {
    return JobsState(
      status: status ?? this.status,
      recruitment: recruitment ?? this.recruitment,
      freelance: freelance ?? this.freelance,
    );
  }

  @override
  List<Object> get props => [status, recruitment, freelance];
}

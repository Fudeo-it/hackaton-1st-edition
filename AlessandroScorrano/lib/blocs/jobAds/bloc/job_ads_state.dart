part of 'job_ads_bloc.dart';

abstract class JobAdsState extends Equatable {
  const JobAdsState();

  @override
  List<Object> get props => [];
}

class JobAdsInitial extends JobAdsState {}

class InitJobAdsState extends JobAdsState {}

class FetchedJobAdsState extends JobAdsState {}

class NoMoreJobAdsState extends JobAdsState {}

class FetchingMoreJobAdsState extends JobAdsState {}

class ErrorJobAdsState extends JobAdsState {
  final String? errorMessage;

  const ErrorJobAdsState([this.errorMessage]);
}

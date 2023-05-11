part of 'job_ads_bloc.dart';

abstract class JobAdsEvent extends Equatable {
  const JobAdsEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchInitialJobAdsEvent extends JobAdsEvent {}

class FetchMoreJobAdsEvent extends JobAdsEvent {}

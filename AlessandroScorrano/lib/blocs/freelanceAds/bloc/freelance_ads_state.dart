part of 'freelance_ads_bloc.dart';

abstract class FreelanceAdsState extends Equatable {
  const FreelanceAdsState();

  @override
  List<Object> get props => [];
}

class FreelanceAdsInitial extends FreelanceAdsState {}

class InitfreelanceAdsState extends FreelanceAdsState {}

class FetchedFreelanceAdsState extends FreelanceAdsState {}

class NoMoreFreelanceAdsState extends FreelanceAdsState {}

class FetchingMoreFreelanceAdsState extends FreelanceAdsState {}

class ErrorFreelanceAdsState extends FreelanceAdsState {
  final String? errorMessage;

  const ErrorFreelanceAdsState([this.errorMessage]);
}

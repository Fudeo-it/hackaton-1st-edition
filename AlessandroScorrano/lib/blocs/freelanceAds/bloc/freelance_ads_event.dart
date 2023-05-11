part of 'freelance_ads_bloc.dart';

abstract class FreelanceAdsEvent extends Equatable {
  const FreelanceAdsEvent();

  @override
  List<Object> get props => [];
}

class FetchInitialFreelanceAdsEvent extends FreelanceAdsEvent {}

class FetchMoreFreelanceAdsEvent extends FreelanceAdsEvent {}

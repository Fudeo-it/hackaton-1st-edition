part of 'job_offers_screen_bloc.dart';

@freezed
class JobOffersScreenState with _$JobOffersScreenState {
  const factory JobOffersScreenState({
    @Default(JobOfferType.hiring)
    JobOfferType activeJobOfferType
  }) = _JobOffersScreenState;
}

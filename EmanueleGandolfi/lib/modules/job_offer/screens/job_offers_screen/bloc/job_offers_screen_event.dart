part of 'job_offers_screen_bloc.dart';

@freezed
class JobOffersScreenEvent with _$JobOffersScreenEvent {
  const factory JobOffersScreenEvent.jobOfferTypeChanged(JobOfferType type) = _ListTypeChanged;
}

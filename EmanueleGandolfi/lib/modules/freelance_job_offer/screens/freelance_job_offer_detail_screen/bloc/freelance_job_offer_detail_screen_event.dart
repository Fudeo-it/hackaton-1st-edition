part of 'freelance_job_offer_detail_screen_bloc.dart';

@freezed
class FreelanceJobOfferDetailScreenEvent with _$FreelanceJobOfferDetailScreenEvent {
  const factory FreelanceJobOfferDetailScreenEvent.initialized() = _Initialized;
  const factory FreelanceJobOfferDetailScreenEvent.favoriteFreelanceJobOfferToggled() = _FavoriteFreelanceJobOfferToggled;
  const factory FreelanceJobOfferDetailScreenEvent.favoriteFreelanceJobOffersChanged(List<String> favoriteFreelanceJobOffersIds) = _FavoriteFreelanceJobOffersChanged;
}

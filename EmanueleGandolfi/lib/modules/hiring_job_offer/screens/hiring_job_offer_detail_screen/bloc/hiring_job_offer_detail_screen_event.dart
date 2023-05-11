part of 'hiring_job_offer_detail_screen_bloc.dart';

@freezed
class HiringJobOfferDetailScreenEvent with _$HiringJobOfferDetailScreenEvent {
  const factory HiringJobOfferDetailScreenEvent.initialized() = _Initialized;
  const factory HiringJobOfferDetailScreenEvent.favoriteHiringJobOfferToggled() = _FavoriteHiringJobOfferToggled;
  const factory HiringJobOfferDetailScreenEvent.favoriteHiringJobOffersChanged(List<String> favoriteHiringJobOffersIds) = _FavoriteHiringJobOffersChanged;
}

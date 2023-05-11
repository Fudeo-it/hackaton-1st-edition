part of 'favorite_freelance_job_offer_list_bloc.dart';

@freezed
class FavoriteFreelanceJobOfferListEvent with _$FavoriteFreelanceJobOfferListEvent {
  const factory FavoriteFreelanceJobOfferListEvent.loadRequested() = _PageRequested;
  const factory FavoriteFreelanceJobOfferListEvent.favoriteFreelanceJobOfferToggled(String freelanceJobOfferId) = _FavoriteFreelanceJobOfferToggled;
  const factory FavoriteFreelanceJobOfferListEvent.favoriteFreelanceJobOffersChanged(List<String> favoriteFreelanceJobOffersIds) = _FavoriteFreelanceJobOffersChanged;
}

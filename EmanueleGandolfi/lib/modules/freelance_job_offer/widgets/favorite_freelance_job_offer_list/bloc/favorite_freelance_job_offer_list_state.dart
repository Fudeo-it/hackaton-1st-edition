part of 'favorite_freelance_job_offer_list_bloc.dart';

@freezed
class FavoriteFreelanceJobOfferListState with _$FavoriteFreelanceJobOfferListState {
  const factory FavoriteFreelanceJobOfferListState({
    @Default(LoadingState<FreelanceJobOffer>())
    LoadingState<FreelanceJobOffer> loadingState,
    @Default([])
    List<String> favoriteFreelanceJobOfferIds
  }) = _FavoriteFreelanceJobOfferListState;
}

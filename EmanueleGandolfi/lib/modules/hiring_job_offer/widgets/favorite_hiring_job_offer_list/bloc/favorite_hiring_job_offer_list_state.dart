part of 'favorite_hiring_job_offer_list_bloc.dart';

@freezed
class FavoriteHiringJobOfferListState with _$FavoriteHiringJobOfferListState {
  const factory FavoriteHiringJobOfferListState({
    @Default(LoadingState<HiringJobOffer>())
    LoadingState<HiringJobOffer> loadingState,
    @Default([])
    List<String> favoriteHiringJobOfferIds
  }) = _FavoriteHiringJobOfferListState;
}

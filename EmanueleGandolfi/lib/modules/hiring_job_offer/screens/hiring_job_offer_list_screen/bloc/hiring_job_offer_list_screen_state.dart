part of 'hiring_job_offer_list_screen_bloc.dart';

@freezed
class HiringJobOfferListScreenState with _$HiringJobOfferListScreenState {
  const factory HiringJobOfferListScreenState({
    @Default(PagingState())
    PagingState<String?, HiringJobOffer> pagingState,
    @Default('')
    String searchQuery,
    @Default(HiringJobOfferFilters())
    HiringJobOfferFilters filters,
    @Default([])
    List<String> favoriteHiringJobOfferIds
  }) = _HiringJobOfferListScreenState;
}

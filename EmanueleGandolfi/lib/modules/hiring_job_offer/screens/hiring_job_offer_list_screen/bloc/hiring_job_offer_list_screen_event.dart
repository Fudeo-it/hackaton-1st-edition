part of 'hiring_job_offer_list_screen_bloc.dart';

@freezed
class HiringJobOfferListScreenEvent with _$HiringJobOfferListScreenEvent {
  const factory HiringJobOfferListScreenEvent.pageRequested(String? pageKey) = _PageRequested;
  const factory HiringJobOfferListScreenEvent.refreshRequested() = _RefreshRequested;
  const factory HiringJobOfferListScreenEvent.searchQueryChanged(String searchQuery) = _SearchQueryChanged;
  const factory HiringJobOfferListScreenEvent.filtersChanged(HiringJobOfferFilters filters) = _FiltersChanged;
  const factory HiringJobOfferListScreenEvent.favoriteHiringJobOfferToggled(String hiringJobOfferId) = _FavoriteHiringJobOfferToggled;
  const factory HiringJobOfferListScreenEvent.favoriteHiringJobOffersChanged(List<String> favoriteHiringJobOffersIds) = _FavoriteHiringJobOffersChanged;
}

part of 'freelance_job_offer_list_screen_bloc.dart';

@freezed
class FreelanceJobOfferListScreenEvent with _$FreelanceJobOfferListScreenEvent {
  const factory FreelanceJobOfferListScreenEvent.pageRequested(String? pageKey) = _PageRequested;
  const factory FreelanceJobOfferListScreenEvent.refreshRequested() = _RefreshRequested;
  const factory FreelanceJobOfferListScreenEvent.searchQueryChanged(String searchQuery) = _SearchQueryChanged;
  const factory FreelanceJobOfferListScreenEvent.filtersChanged(FreelanceJobOfferFilters filters) = _FiltersChanged;
  const factory FreelanceJobOfferListScreenEvent.favoriteFreelanceJobOfferToggled(String freelanceJobOfferId) = _FavoriteFreelanceJobOfferToggled;
  const factory FreelanceJobOfferListScreenEvent.favoriteFreelanceJobOffersChanged(List<String> favoriteFreelanceJobOffersIds) = _FavoriteFreelanceJobOffersChanged;
}

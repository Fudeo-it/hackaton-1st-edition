part of 'freelance_job_offer_list_screen_bloc.dart';

@freezed
class FreelanceJobOfferListScreenState with _$FreelanceJobOfferListScreenState {
  const factory FreelanceJobOfferListScreenState({
    @Default(PagingState())
    PagingState<String?, FreelanceJobOffer> pagingState,
    @Default('')
    String searchQuery,
    @Default(FreelanceJobOfferFilters())
    FreelanceJobOfferFilters filters,
    @Default([])
    List<String> favoriteFreelanceJobOfferIds
  }) = _FreelanceJobOfferListScreenState;
}

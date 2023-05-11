import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:offertelavoroflutter_app/helpers/rx_helper.dart';
import 'package:offertelavoroflutter_app/modules/common/models/paged_list/paged_list.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/models/freelance_job_offer/freelance_job_offer.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/models/freelance_job_offer_filters/freelance_job_offer_filters.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/repositories/freelance_job_offer_repository.dart';
import 'package:rxdart/rxdart.dart';

part 'freelance_job_offer_list_screen_event.dart';
part 'freelance_job_offer_list_screen_state.dart';
part 'freelance_job_offer_list_screen_bloc.freezed.dart';

class FreelanceJobOfferListScreenBloc extends Bloc<FreelanceJobOfferListScreenEvent, FreelanceJobOfferListScreenState> {
  final FreelanceJobOfferRepository _freelanceJobOfferRepository;
  final int pageSize = 5;
  late StreamSubscription<List<String>> _favoriteFreelanceJobOfferIdsSub;

  FreelanceJobOfferListScreenBloc({
    required FreelanceJobOfferRepository freelanceJobOfferRepository
  }) : _freelanceJobOfferRepository = freelanceJobOfferRepository, super(const FreelanceJobOfferListScreenState()) {
    on<FreelanceJobOfferListScreenEvent>((event, emit) async {
      await event.when<Future>(
        pageRequested: (pageKey) => _pageRequested(pageKey, emit),
        searchQueryChanged: (searchQuery) => _searchQueryChanged(searchQuery, emit),
        refreshRequested: () => _refreshRequested(emit),
        filtersChanged: (filters) => _filtersChanged(filters, emit),
        favoriteFreelanceJobOfferToggled: (freelanceJobOfferId) => _favoriteFreelanceJobOfferToggled(freelanceJobOfferId, emit),
        favoriteFreelanceJobOffersChanged: (favoriteFreelanceJobOffersIds) => _favoriteFreelanceJobOffersChanged(favoriteFreelanceJobOffersIds, emit),
      );
    }, transformer: (events, mapper) => RxHelper.maybeDebounceEvents(
        test: (event) => event.maybeMap(searchQueryChanged: (value) => true, orElse: () => false),
        debounceTime: const Duration(milliseconds: 500),
        events: events,
      ).flatMap(mapper)
    );

    _favoriteFreelanceJobOfferIdsSub = _freelanceJobOfferRepository.favoriteFreelanceJobOfferIdsStream.listen((favoriteFreelanceJobOffersIds) {
      add(FreelanceJobOfferListScreenEvent.favoriteFreelanceJobOffersChanged(favoriteFreelanceJobOffersIds));
    });
  }

  @override
  Future<void> close() {
    _favoriteFreelanceJobOfferIdsSub.cancel();
    return super.close();
  }

  _pageRequested(String? pageKey, Emitter<FreelanceJobOfferListScreenState> emit) async {
    try {
      PagedList<FreelanceJobOffer> pagedList = await _freelanceJobOfferRepository.getFreelanceJobOffers(
        pageSize: pageSize,
        startCursor: pageKey,
        searchText: state.searchQuery,
        filters: state.filters
      );

      emit(state.copyWith(
        pagingState: PagingState(
          nextPageKey: pagedList.nextPageKey,
          itemList: (state.pagingState.itemList ?? [])..addAll(pagedList.results),
          error: null,
        ),
        // we fetch the favorites list only on first page load
        favoriteFreelanceJobOfferIds: (pageKey == null) ? _freelanceJobOfferRepository.getFavoriteFreelanceJobOfferIds() : state.favoriteFreelanceJobOfferIds
      ));
    } catch (err) {
      emit(state.copyWith(pagingState: PagingState(
        itemList: state.pagingState.itemList,
        nextPageKey: state.pagingState.nextPageKey,
        error: err
      )));
    }
  }

  _searchQueryChanged(String searchQuery, Emitter<FreelanceJobOfferListScreenState> emit) async {
    if(searchQuery == state.searchQuery) return;

    emit(state.copyWith(
      searchQuery: searchQuery,
      pagingState: const PagingState())
    );
  }

  _refreshRequested(Emitter<FreelanceJobOfferListScreenState> emit) async {
    emit(state.copyWith(
      pagingState: const PagingState())
    );
  }

  _filtersChanged(FreelanceJobOfferFilters filters, Emitter<FreelanceJobOfferListScreenState> emit) async {
    emit(state.copyWith(
      pagingState: const PagingState(),
      filters: filters
    ));
  }

  _favoriteFreelanceJobOfferToggled(String freelanceJobOfferId, Emitter<FreelanceJobOfferListScreenState> emit) async {
    _freelanceJobOfferRepository.toggleFavoriteFreelanceJobOffer(freelanceJobOfferId);
  }

  _favoriteFreelanceJobOffersChanged(List<String> favoriteFreelanceJobOfferIds, Emitter<FreelanceJobOfferListScreenState> emit) async {
    emit(state.copyWith(
      favoriteFreelanceJobOfferIds: favoriteFreelanceJobOfferIds
    ));
  }
}
